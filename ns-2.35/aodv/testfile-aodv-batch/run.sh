#!/bin/sh  
#判断以下文件是否存在,如果存在，则将其删除  
#$1.1.data  
if [ -f $1.1.data ]; then  
         rm $1.1.data;  
fi  
#$1.1.temp  
if [ -f $1.1.temp ]; then  
         rm $1.1.temp;  
fi  
#$1.2.data  
if [ -f $1.2.data ]; then  
         rm $1.2.data;  
fi  
#$1.2.temp  
if [ -f $1.2.temp ]; then  
         rm $1.2.temp;  
fi  
#$1.plot  
if [ -f $1.plot ]; then  
         rm $1.plot;  
fi  
   
for j in 0 50 100 200 300  
do  
         for i in $(seq 1 1 5)  
         do  
                   /ns2/ns-2.35/indep-utils/cmu-scen-gen/setdest/setdest -n 50 -p $j -M 20 -t 300 -x 1000 -y 300 > scene-50n-0p-20M-300t-1000-300  
   
                   #生成数据流场景1  
                   ns /ns2/ns-2.35/indep-utils/cmu-scen-gen/cbrgen.tcl -type cbr -nn 50 -seed 1 -mc 10 -rate 2.0 > cbr-50n-10c-2p  
                   ns aodv.tcl ; #一次NS运行  
                   nawk -v outfile=$1.1.temp -v scr=$i -f getRatio.awk $1.tr  
   
                   #生成数据流场景2  
                   ns /ns2/ns-2.35/indep-utils/cmu-scen-gen/cbrgen.tcl -type cbr -nn 50 -seed 1 -mc 20 -rate 2.0 > cbr-50n-10c-2p  
                   ns aodv.tcl ; #一次NS运行  
                   nawk -v outfile=$1.2.temp -v scr=$i -f getRatio.awk $1.tr  
         done  
         nawk -v outfile=$1.1.data -v time=$j -f average.awk $1.1.temp  
         rm $1.1.temp  
   
         nawk -v outfile=$1.2.data -v time=$j -f average.awk $1.2.temp  
         rm $1.2.temp  
done  
   
echo "#'!'/bin/sh" >> $1.plot  
echo "set terminal gif small  x255255255" >> $1.plot  
echo "set output \"$1.gif\"" >> $1.plot  
echo "set ylabel \"Ratio(%)\"" >> $1.plot  
echo "set xlabel \"Settle Times(s)\"" >> $1.plot  
echo "set key left top box" >> $1.plot  
echo "set title \"AODV Ratio result\"" >> $1.plot  
echo "plot \"$1.1.data\" title \"$1-cbr 10\" with linespoints, \"$1.2.data\" title \"$1-cbr 20\" with linespoints" >> $1.plot  
   
gnuplot $1.plot  