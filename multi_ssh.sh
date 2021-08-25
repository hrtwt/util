#!/bin/bash

set -eu

# ip60=(172.16.2.117 172.16.2.119 172.16.2.81 172.16.2.115 172.16.2.116 172.16.2.118)
# ip59=(172.16.2.121 172.16.2.123 172.16.2.120 172.16.2.125 172.16.2.122 172.16.2.114)
# ip57=(172.16.2.127 172.16.2.124 172.16.2.126 172.16.2.92 172.16.2.128 172.16.2.129)
# ip61=(172.16.2.132 172.16.2.136 172.16.2.87 172.16.2.135 172.16.2.134 172.16.2.133)
# ipg1=("${ip60[@]} ${ip59[@]}")
# ipg2=("${ip57[@]} ${ip61[@]}")
# ipall=("${ip60[@]} ${ip59[@]} ${ip57[@]} ${ip61[@]}")


if [ $# != 4 ]; then
  echo "$0 session_name ip_array user_name private_key"
  exit 1
fi

readonly SESSION=$1
readonly IP_ARRAY=$2
readonly USER=$3
readonly PRIVATE_KEY=$4

tmux new-session -d -n multi-ssh -s $SESSION

# workaround for tmux error
#cmd.exe /c "start wt.exe --window 0 new-tab wsl.exe -- tmux attach-session -t $SESSION"

for ip in $(eval echo '${'$IP_ARRAY'[@]}')
do
  tmux split-window -t $SESSION
  tmux select-layout -t $SESSION tiled
  tmux send-keys "ssh -i ${PRIVATE_KEY} -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null ${USER}@${ip}" C-m
  echo $ip added
done

tmux kill-pane -t 0
tmux select-pane -t 0
tmux select-layout -t $SESSION tiled
tmux set-window-option synchronize-panes on

tmux attach-session -t $SESSION
