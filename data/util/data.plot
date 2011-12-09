set yr [0:1023]
plot "data" using 1:2 with lines
set terminal png
set output "data.png"
replot

