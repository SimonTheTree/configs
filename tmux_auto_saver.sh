#!/bin/bash

# Loop while tmux is running
while tmux info &>/dev/null; do
    sleep 2
done

# When tmux exits, save session
~/.tmux/plugins/tmux-resurrect/scripts/save.sh
