i="0"
rm "tpVspacketsize.plt"
while [ $i -lt 2200 ]
do
echo "packet size=$i"
./waf --run "scratch/adhoc_grid --packetSize=$i --prog=1"
i=$[ $i+ 10 ]
done
gnuplot << EOF
 set xlabel "packet size"
        set ylabel "tp"
        set term png
        set output "packetSize-tp.png" with lines
plot "tpVspacketsize.plt" using 1:2
EOF
