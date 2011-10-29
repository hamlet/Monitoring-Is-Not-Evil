set yr [0:1023]
plot "data" using 1:2 with lines, "data" using 1:3 with lines, "data" using 1:4 with impulses
set terminal png
set output "data.png"
replot

