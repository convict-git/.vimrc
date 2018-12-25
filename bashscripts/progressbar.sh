#!/bin/bash
function ProgressBar {
  let _progress=(${1}*100/${2}*100)/100
  let _done=(${_progress}*4)/10
  let _left=40-$_done
  _fill=$(printf "%${_done}s")
  _empty=$(printf "%${_left}s")

  clear
  a=$(date +%T)
  figlet $a
  let _lvl1=(${2}/4)
  let _lvl2=(${2}/2)
  let _lvl3=(${2}/4)*3
  let _lvl4=(${2}/1)
  if [ "${1}" -eq "$_lvl1" ] ; then
	 festival -b '(voice_cmu_us_slt_arctic_hts)' \
		'(SayText "Sir, Please focus! Great things never come from comfort zones...")' &
  fi

  if [ "${1}" -eq "$_lvl2" ] ; then
	 festival -b '(voice_cmu_us_slt_arctic_hts)' \
		'(SayText "Sir, Please focus! Train hard and be patient. It will pay off...")' &
  fi

  if [ "${1}" -eq "$_lvl2" ] ; then
	 festival -b '(voice_cmu_us_slt_arctic_hts)' \
		'(SayText "Sir, Please focus! Train hard and be patient. It will pay off...")' &
  fi

  if [ "${1}" -eq "$_lvl3" ] ; then
	 festival -b '(voice_cmu_us_slt_arctic_hts)' \
		'(SayText "Sir, Please focus! Keep fighting till the last minute...")' &
  fi

  if [[ "${1}" -gt "$_lvl1" && "${1}" -le "$_lvl2" ]] ; then
	 printf "\r\e[33mProgress : [${_fill// /\▇}${_empty// /-}] ${_progress}%% $(date +%T) "
  elif [[ "${1}" -gt "$_lvl2" && "${1}" -le "$_lvl3" ]] ; then
	 printf "\r\e[32mProgress : [${_fill// /\▇}${_empty// /-}] ${_progress}%% $(date +%T)"
  elif [[ "${1}" -gt "$_lvl3" && "${1}" -le "$_lvl4" ]] ; then
	 printf "\r\e[31mProgress : [${_fill// /\▇}${_empty// /-}] ${_progress}%% $(date +%T)"
  elif [ "${1}" -le "$_lvl1" ] ; then
	 printf "\rProgress : [${_fill// /\▇}${_empty// /-}] ${_progress}%% $(date +%T) "
  fi
}
_start=1
_end=$1
_left=$((_end))

festival -b '(voice_cmu_us_slt_arctic_hts)' \
  '(SayText "Sir, Timer starts... Good luck and give your best!")'
for number in $(seq ${_start} ${_end})
do
  sleep 1
  ProgressBar ${number} ${_end} ${_left}
  final_time=$(($_end-$number))
  time_left_formated=$(date +%H:%M:%S -ud @${final_time})
  printf "\n\n\t\t\r\e[7mTime Left: $time_left_formated  \e[0m"
done
printf '\nFinished!\n'
festival -b '(voice_cmu_us_slt_arctic_hts)' \
  '(SayText "Sir, the times up! Hope you enjoyed the problem set...")'
