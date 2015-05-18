i="-10"
rm "tpVsrxgain1.plt"
while [ $i -lt 20 ]
do
echo "power=$i"
./waf --run "scratch/adhoc_grid --rxgain=$i --prog=7 --packetSize=3000"
i=$[ $i+ 1 ]
done
gnuplot << EOF
 set xlabel "RXgain-rts-cts"
        set ylabel "tp"
        set term png
        set output "rxgain-tp-rts-cts.png" with lines
plot "tpVsrxgain1.plt" using 1:2
EOF
