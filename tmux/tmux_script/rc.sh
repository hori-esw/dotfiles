#!/bin/bash
#exec >> ~/tmux_script/log 2>&1

rc_file=~/tmux_script/include/rc.txt
pane_num=$(tmux display -p '#P')

cat $rc_file | while read cmd
do
    tmux send-keys -t $pane_num " $cmd"
done

