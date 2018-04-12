#'!'/bin/sh
set terminal gif small  x255255255
set output "aodv.gif"
set ylabel "Ratio(%)"
set xlabel "Settle Times(s)"
set key left top box
set title "AODV Ratio result"
plot "aodv.1.data" title "aodv-cbr 10" with linespoints, "aodv.2.data" title "aodv-cbr 20" with linespoints
