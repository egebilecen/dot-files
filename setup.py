#!/usr/bin/env python3
from os.path import expanduser
import subprocess

BASHRC_PATH = expanduser("~/.bashrc")
BASHRC_COMMANDS = []
PACKAGES = []

# Commands
# tmux
BASHRC_COMMANDS.append("""
# Start a tmux session automatically.
if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
    cd ~/
    exec tmux -u new -s 
fi
""")
# End tmux
# End Commands

# Packages
PACKAGES.append("tmuxp")
# End Packages

def exec_cmd(cmd: str) -> int:
    proc = subprocess.Popen(cmd.split(), stderr=subprocess.STDOUT, stdout=subprocess.DEVNULL)
    proc.wait()
    return proc.returncode

def main():
    # .bashrc Update
    _skipped = 0
    with open(BASHRC_PATH, "r+") as f:
        content = f.read()

        for cmd in BASHRC_COMMANDS:
            cmd = cmd.strip()

            if cmd not in content:
                cmd = "\n" + cmd + "\n"
                content += cmd
                f.write(cmd)
            else:
                _skipped += 1

    if _skipped > 0:
        print("[?] - {} .bashrc command(s) is/are skipped as they are already exist in the file.".format(_skipped))
    # End .bashrc Update

    # Install Packages
    for package in PACKAGES:
        res = exec_cmd("apt install {} -y".format(package))

        if res != 0:
            print("[!] - Failed to install package `{}`.".format(package))
    # End Install Packages

if __name__ == "__main__":
    main()
