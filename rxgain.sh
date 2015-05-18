i="-10"
rm "tpVsrxgain.plt"
while [ $i -lt 20 ]
do
echo "power=$i"
./waf --run "scratch/adhoc_grid --rxgain=$i --prog=3"
i=$[ $i+ 1 ]
done
gnuplot << EOF
 set xlabel "RXgain"
        set ylabel "tp"
        set term png
        set output "rxgain-tp.png" with lines
plot "tpVsrxgain.plt" using 1:2
EOF
