set terminal pngcairo size 800,600
set output 'sq3_steady.png'
set encoding utf8
set termoption noenhanced
set title "Square Wave 820ms (Steady)"
set xlabel "s"
set ylabel "V"
set grid
unset logscale x 
set xrange [1.300000:3.000000]
unset logscale y
set yrange [-6.000000e+00:6.000000e+00]
set format y "%g"
set format x "%g"
plot 'sq3_steady.txt' using 1:2 with lines lw 1 title "v(1)",\
'sq3_steady.txt' using 3:4 with lines lw 1 title "v(2)"
