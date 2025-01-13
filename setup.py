#!/usr/bin/env python3
import os
import sys
import subprocess

BASHRC_PATH = os.path.expanduser("~/.bashrc")

APT_PACKAGES = []
SHELL_COMMANDS = []
BASHRC_COMMANDS = []

# Packages
APT_PACKAGES.append("tmux")
APT_PACKAGES.append("tmuxp")

## Following packages are for NeoVim (and plugins).
APT_PACKAGES.append("wget")
APT_PACKAGES.append("unzip")
APT_PACKAGES.append("make")
APT_PACKAGES.append("cmake")
APT_PACKAGES.append("gdb")
APT_PACKAGES.append("ripgrep")
APT_PACKAGES.append("python3-pip")
APT_PACKAGES.append("python3-venv")
APT_PACKAGES.append("python3-neovim")
APT_PACKAGES.append("python3-pynvim")
# End Packages

# Shell Commands to Run
## Each line is a command.

## TMUX Package Manager
SHELL_COMMANDS.append("""
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
""")
## End TMUX Package Manager

## NeoVim
SHELL_COMMANDS.append("""
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
sudo rm -rf /opt/nvim
sudo tar -C /opt -xzf nvim-linux64.tar.gz
""")
## End NeoVim
# End Shell Commands to Run

# .bashrc Commands
## tmux
BASHRC_COMMANDS.append("""
# Start a tmux session automatically.
if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
    cd ~/
    exec tmux -u new -s 
fi
""")
## End tmux

## NeoVim
BASHRC_COMMANDS.append("export PATH=\"$PATH:/opt/nvim-linux64/bin\"")
## End NeoVim
# End .bashrc Commands

def exec_cmd(cmd: str) -> int:
    proc = subprocess.Popen(cmd.split(), stderr=subprocess.STDOUT, stdout=subprocess.DEVNULL)
    proc.wait()
    return proc.returncode

def main():
    if os.geteuid() != 0:
        print("[!] - Be sure to run the script as root!")
        sys.exit(1)

    # Install APT Packages
    for package in APT_PACKAGES:
        print("[?] - Installing the package `{}`".format(package))
        res = exec_cmd("apt install {} -y".format(package))

        if res != 0:
            print("[-] - Failed to install the package `{}`.".format(package))
        else:
            print("[+] - If it's not installed already, successfully installed the package `{}`.".format(package))
        print()
    # End Install APT Packages

    # Run Shell Commands
    for shell_command_multiline in SHELL_COMMANDS:
        shell_commands = [cmd for cmd in shell_command_multiline.splitlines() if cmd]

        for shell_cmd in shell_commands:
            res = exec_cmd(shell_cmd)

            if res != 0:
                print("[-] - Command result is not 0! Command: \"{}\", result: {}.".format(shell_cmd, res))
                print()
    # End Run Shell Commands

    # .bashrc Commands
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
    # End .bashrc Commands

if __name__ == "__main__":
    main()
