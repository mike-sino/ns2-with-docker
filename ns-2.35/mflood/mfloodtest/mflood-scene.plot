set term png medium monochrome
set output "mflood-scene.png"
set ylabel "Transmission Speed(KB/s)"
set xlabel "Time(s)"
set key left top box
set title "MFlood Ananysis"
plot "mflood-scene-1-2.data" title "1->2" with linespoints,"mflood-scene-4-5.data" title "4->5" with linespoints,"mflood-scene-4-6.data" title "4->6" with linespoints,"mflood-scene-6-7.data" title "6->7" with linespoints,"mflood-scene-7-8.data" title "7->8" with linespoints
