#!/usr/bin/env python3
from os.path import expanduser

BASH_RC_PATH = expanduser("~/.bashrc")
COMMANDS = []

# tmux
COMMANDS.append("""
# Start a tmux session automatically.
if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
  exec tmux -u new -s 
fi
""")
# end tmux


def main():
    with open(BASH_RC_PATH,  "r+") as f:
        content = f.read()

        for cmd in COMMANDS:
            cmd = cmd.strip()

            if cmd not in content:
                cmd = "\n" + cmd + "\n"
                content += cmd
                f.write(cmd)


if __name__ == "__main__":
    main()
