#!/bin/sh
sh prep.sh
sleep 2

echo starting 
cat /dev/ttyUSB0 > data.all &
pid=$!
sleep $1
kill $pid

cat data.all | sed -n -e '/%\(.*\)% |\(.*\)|/P' | sed -e 's/%\(.*\)% |\(.*\)|/\1 \2/' > data
grep \+\+ data.all | sed -e 's/++\(.*\)+ ~\(.*\)~ |\(.*\)|/\1 \2 \3/' > data.avg

gnuplot -p data.plot 
cat data | ./data_avg.rb

if [ -n $2 ] ; then
  cp data $2.txt
  mv data.avg $2.avg
  mv data.png $2.png
fi
