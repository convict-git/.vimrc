trapped=""
trap 'trapped=yes' SIGCHLD
./trial.sh > logme  && cat logme &
sleep 2
[ -z "$trapped" ] && kill $! 2>/dev/null && echo -e "\e[31m\e[1mTime Limit Exceeded\e[0m"
