#! /bin/bash
while :
do
  tmux send-keys -t allbrowse R
  tmux send-keys -t browse R
  echo -e "\e[3m\e[32mRefreshing tmux.\e[0m"
  sleep 1
  clear
  echo -e "\e[3m\e[32mRefreshing tmux..\e[0m"
  sleep 1
  clear
  echo -e "\e[3m\e[32mRefreshing tmux...\e[0m"
  sleep 1
  clear
done


