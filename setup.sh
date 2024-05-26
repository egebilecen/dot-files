#!/bin/bash
BASH_RC_PATH=~/.bashrc
CONFIG_START_COMMENT="# EB Configuration"

# tmux
# Start a tmux session automatically.
TMUX_AUTO_SESSION_CMD=$(cat <<-END
if command -v tmux &> /dev/null && [ -n "\$PS1" ] && [[ ! "\$TERM" =~ screen ]] && [[ ! "\$TERM" =~ tmux ]] && [ -z "\$TMUX" ]; then
  exec tmux -u new -s 
fi
END
)
# end tmux

if ! grep -Fqx "$CONFIG_START_COMMENT" $BASH_RC_PATH;
then
    echo "" >> $BASH_RC_PATH
    echo "$CONFIG_START_COMMENT" >> $BASH_RC_PATH
    echo "$TMUX_AUTO_SESSION_CMD" >> $BASH_RC_PATH
fi

