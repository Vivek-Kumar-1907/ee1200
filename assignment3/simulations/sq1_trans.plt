set terminal pngcairo size 800,600
set output 'sq1_trans.png'
set encoding utf8
set termoption noenhanced
set title "Square Wave 8.2us (Transient)"
set xlabel "s"
set ylabel "V"
set grid
unset logscale x 
set xrange [0.000000e+00:2.500000e-05]
unset logscale y 
set yrange [-6.000000:6.000000]
set format y "%g"
set format x "%g"
plot 'sq1_trans.txt' using 1:2 with lines lw 1 title "v(1)",\
'sq1_trans.txt' using 3:4 with lines lw 1 title "v(2)"
