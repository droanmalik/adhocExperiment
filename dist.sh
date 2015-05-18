i="1"
rm "tpVsdist.plt"
while [ $i -lt 700 ]
do
echo "distance=$i"
./waf --run "scratch/adhoc_grid --distance=$i --prog=0"
i=$[ $i+ 1 ]
done
gnuplot << EOF
 set xlabel "distance"
        set ylabel "tp"
        set term png
        set output "distance-tp.png"
plot "tpVsdist.plt" using 1:2
EOF
