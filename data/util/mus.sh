mpg123  "/mnt/data/music/Ac_dc/1980 - Back In Black/01 - Hells Bells.mp3" &
pid=$!
sleep $1
kill $pid
