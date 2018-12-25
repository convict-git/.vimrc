#!/bin/sh
tmux new-session -d 'vim'
tmux split-window -h 'w3m https://codeforces.com/submissions/mr.convict'
tmux -2 attach-session -d
