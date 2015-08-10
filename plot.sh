#!/usr/bin/gnuplot
reset
set terminal png size 1200,720 font arial 6

set xdata time
set timefmt "%H:%M:%S"
set format x "%H:%M"
set xlabel "time"

set ylabel "temperature"
set yrange [60:90]

set title "Temperature"
set key reverse Left outside
set grid

set style data linespoints

plot "/var/www/temp.html" using 4:7 title "oF"
