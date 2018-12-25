#! /bin/bash
tmux kill-session -t allbrowse
tmux new-session -s allbrowse 'w3m https://codeforces.com/problemset/status'
