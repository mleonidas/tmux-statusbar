#!/usr/bin/env bash

# set statusbar to the top
tmux set-option -g status-position bottom 

# set left statusbar
tmux set-option -g status-left 'tmux:[#S] '

# set the left and right length of statusbar
tmux set-option -g status-left-length 90
tmux set-option -g status-right-length 90

# set refresh interval for statusbar
tmux set-option -g status-interval 1

# centralize statusbar
tmux set-option -g status-justify left 

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

if sysctl hw.model | grep 'Book' >/dev/null; then
  tmux set-option -g status-right "#[fg=colour205]#($CURRENT_DIR/scripts/wifi -r -s)#[default]   #($CURRENT_DIR/scripts/battery -t -r)  %a %d %h %H:%M"
else
  tmux set-option -g status-right "%a %d %h %H:%M"
fi
