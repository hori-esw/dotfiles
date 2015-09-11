#!/bin/bash

pane_num=$(tmux display -p '#P')
password='#### enter your root password ####'
sleep_time=1


tmux send-keys -t $pane_num " su -" C-m
sleep $sleep_time
tmux send-keys -t $pane_num "$password" C-m

#~/tmux_script/rc.sh >> ~/tmux_script/log 2>&1
~/tmux_script/rc.sh
