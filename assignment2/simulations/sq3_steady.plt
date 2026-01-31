set terminal pngcairo size 800,600
set output 'sq3_steady.png'
set encoding utf8
set termoption noenhanced
set title "Square Wave 82ms (Steady)"
set xlabel "s"
set ylabel "V"
set grid
unset logscale x 
# Zoom on 300ms to 464ms (2 cycles)
set xrange [3.000000e-01:4.640000e-01]
unset logscale y 
set yrange [-0.5:5.5]
set format y "%g"
set format x "%g"
plot 'sq3_steady.txt' using 1:2 with lines lw 1 title "v(1)",\
'sq3_steady.txt' using 3:4 with lines lw 1 title "v(2)"
