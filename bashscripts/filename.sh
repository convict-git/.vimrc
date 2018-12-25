base=$(realpath ../../)                        #/home/convict/Desktop/3xc3pt10n/3xc3pt10n/codeforces
problem_comp=$(pwd)                            #/home/convict/Desktop/3xc3pt10n/3xc3pt10n/codeforces/363/B
contest_comp=$(realpath ../)                   #/home/convict/Desktop/3xc3pt10n/3xc3pt10n/codeforces/363
problem=${problem_comp#"$contest_comp"}        #/B
problem=${problem#"/"}                         #B
base="$base/"                                  #/home/convict/Desktop/3xc3pt10n/3xc3pt10n/codeforces/
contest=${contest_comp#"$base"}                #363
tmux new-session -d -s idne 'autow3m'
idne $contest$problem $1                       #idne 363B B.cpp
tmux kill-session -t idne
