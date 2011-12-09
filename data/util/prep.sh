screen -m -D /dev/ttyUSB0 115200 &
pid=$!
sleep 2
kill $pid
