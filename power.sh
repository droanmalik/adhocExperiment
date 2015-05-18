i="0"
rm "tpVspower.plt"
while [ $i -lt 50 ]
do
echo "power=$i"
./waf --run "scratch/adhoc_grid --power=$i --prog=2"
i=$[ $i+ 1 ]
done
gnuplot << EOF
 set xlabel "power"
        set ylabel "tp"
        set term png
        set output "power-tp.png" with lines
plot "tpVspower.plt" using 1:2
EOF
