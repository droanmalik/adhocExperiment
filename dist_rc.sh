i="1"
rm "tpVsdist1.plt"
while [ $i -lt 700 ]
do
echo "distance=$i"
./waf --run "scratch/adhoc_grid --distance=$i --prog=4 --packetSize=3000"
i=$[ $i+ 1 ]
done
gnuplot << EOF
 set xlabel "distance-rts-cts"
        set ylabel "tp"
        set term png
        set output "distance-tp-rts-cts.png"
plot "tpVsdist1.plt" using 1:2
EOF
