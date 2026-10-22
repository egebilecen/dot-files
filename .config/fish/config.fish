set -U fish_greeting ""

alias c="clear"
alias ll="ls -lah"
alias vi="nvim"

# KDE
# alias keep_awake="systemd-inhibit --what=idle:sleep --why=\"preventing lock and sleep\" sleep infinity"
# alias no_sleep="systemd-inhibit --what=sleep --why=\"preventing sleep\" sleep infinity"
# alias fix_hdmi="kscreen-doctor output.HDMI-A-1.disable && sleep 1 && kscreen-doctor output.HDMI-A-1.enable"

# Auto-start or attach to tmux session
# if status is-interactive
#     and not set -q TMUX
#     tmux new-session -A -s Zaphiel
# end
