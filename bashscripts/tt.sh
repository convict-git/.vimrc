#! /bin/bash
cur_time=$(date +%T)
code1=00:19:00
code1=14:00:00
code1=21:00:00
cur_Time=`date +%s -d ${cur_time}`
sec1=`date +%s -d ${code1}`
sec2=`date +%s -d ${code2}`
sec3=`date +%s -d ${code3}`
if [ "$cur_Time" -eq "$sec1" ] ; then
  espeak "Sir, It's your coding time! Good luck." &
  ./progressbar.sh 14400
elif [ "$cur_Time" -eq "$sec2" ] ; then
  espeak "Blogs time! Sir, you may want to upsolve."
  ./progressbar.sh 10800
elif [ "$cur_Time" -eq "$sec3" ] ; then
  espeak "Blogs time! Sir, you may want to upsolve."
  ./progressbar.sh 10800
else ./clk.sh &
fi
