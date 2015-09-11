#!/bin/bash
name="session_name"
#ip_list=(ip1 ip2 host1 host2)
ip_list=($1)
password="$2"
rc_file="$(dirname $0)/include/rc.txt"

tmux new-session -s ${name} -d

for i in ${ip_list[@]}
do
  tmux new-window -t ${name} -n ${i}
#  tmux send-keys -t ${i}.0 "ssh webadmin@${i}" C-m
#  sleep 5
#  tmux send-keys -t ${i}.0 "${password}" C-m
  tmux send-keys -t ${i}.0 "sshpass -p '${password}' ssh -o StrictHostKeyChecking=no webadmin@${i}" C-m
  #echo "ssh ${i}"
  cat $rc_file | while read cmd
  do
      tmux send-keys -t ${i}.0 " $cmd"
  done
done

tmux attach
