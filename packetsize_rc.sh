i="2210"
rm "tpVspacketsize1.plt"
while [ $i -lt 4200 ]
do
echo "packet size=$i"
./waf --run "scratch/adhoc_grid --packetSize=$i --prog=5"
i=$[ $i+ 10 ]
done
gnuplot << EOF
 set xlabel "packet size-rts-cts"
        set ylabel "tp"
        set term png
        set output "packetSize-tp-rts-cts.png" with lines
plot "tpVspacketsize1.plt" using 1:2
EOF
