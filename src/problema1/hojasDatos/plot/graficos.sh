#!/bin/bash

FMT_BEGIN=20161010 0220
FMT_END=20161010 0223
FMT_X_SHOW=%m/%d


graficar()
{
	gnuplot << EOF 2> error.log
	set xdata time
	set timefmt "%Y%m%d%H%M"
	set xrange ["$FMT_BEGIN" : "$FMT_END"]
	set format x "$FMT_X_SHOW"
	set terminal png
	set output 'fig1.pgn'
	plot "graf-0.dat" using 1:3 with lines title "sensor1","graf-0.dat" using 1:4 with linespoints title "sensor2"
EOF
}
graficar
