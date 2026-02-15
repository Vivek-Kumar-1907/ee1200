set terminal pngcairo size 800,600
set output 'sq2_steady.png'
set encoding utf8
set termoption noenhanced
set title "Square Wave 820us (Steady)"
set xlabel "s"
set ylabel "V"
set grid
unset logscale x 
set xrange [4.000000e-03:6.000000e-03]
unset logscale y
set yrange [-6.000000e+00:6.000000e+00]
set format y "%g"
set format x "%g"
plot 'sq2_steady.txt' using 1:2 with lines lw 1 title "v(1)",\
'sq2_steady.txt' using 3:4 with lines lw 1 title "v(2)"
