i="0"
rm "tpVspower1.plt"
while [ $i -lt 50 ]
do
echo "power=$i"
./waf --run "scratch/adhoc_grid --power=$i --prog=6 --packetSize=3000"
i=$[ $i+ 1 ]
done
gnuplot << EOF
 set xlabel "power-rts-cts"
        set ylabel "tp"
        set term png
        set output "power-tp-rts-cts.png" with lines
plot "tpVspower1.plt" using 1:2
EOF
