#!/bin/sh

cat /dev/ttyUSB0 | sed -n -e '/%\(.*\)% |\(.*\)|/P' | sed -e 's/%\(.*\)% |\(.*\)|/\1 \2/' > data &
pid=$!
sleep $1
kill $pid

gnuplot -p data.plot 
cat data | ./data_avg.rb

if [ -n $2 ] ; then
  cp data $2.txt
  mv data.png $2.png
fi
