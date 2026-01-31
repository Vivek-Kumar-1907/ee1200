set terminal pngcairo size 800,600
set output 'sq3_trans.png'
set encoding utf8
set termoption noenhanced
set title "Square Wave 82ms (Transient)"
set xlabel "s"
set ylabel "V"
set grid
unset logscale x 
set xrange [0.000000e+00:1.650000e-01]
unset logscale y 
set yrange [-0.5:5.5]
set format y "%g"
set format x "%g"
plot 'sq3_trans.txt' using 1:2 with lines lw 1 title "v(1)",\
'sq3_trans.txt' using 3:4 with lines lw 1 title "v(2)"
