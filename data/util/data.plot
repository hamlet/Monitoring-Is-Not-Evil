set yr [0:1023]
plot "data" using 1:2 title "BF" with lines, "data.avg" using 1:2 title "avg" with lines, "data.avg" using 1:3 title "deviation" with lines
set terminal png
set output "data.png"
replot

