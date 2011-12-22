# set yr [0:1023]
set xdata time
set timefmt "%Y%m%d%H%M"
set format x "%d-%H"
plot "test_long_kitchen.avg.date" using 1:2 title "avg" with lines, "test_long_kitchen.avg.date" using 1:3 title "deviation" with impulses
set terminal png
set output "data.avg.png"
replot

