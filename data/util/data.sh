#!/bin/sh
sh prep.sh

cat /dev/ttyUSB0 | tee data.all | sed -n -e '/%\(.*\)% |\(.*\)|/P' | sed -e 's/%\(.*\)% |\(.*\)|/\1 \2/' > data &
pid=$!
sleep $1
kill $pid

grep \+\+ data.all | sed -e 's/++\(.*\)+ ~\(.*\)~ |\(.*\)|/\1 \2 \3/' > data.avg

gnuplot -p data.plot 
cat data | ./data_avg.rb

if [ -n $2 ] ; then
  cp data $2.txt
  mv data.avg $2.avg
  mv data.png $2.png
fi
