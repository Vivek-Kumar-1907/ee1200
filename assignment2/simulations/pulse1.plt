set terminal pngcairo size 800,600
set output 'pulse1.png'
set encoding utf8
set termoption noenhanced
set title "500us Pulse Signal"
set xlabel "s"
set ylabel "V"
set grid
unset logscale x 
set xrange [0.000000e+00:2.000000e-03]
unset logscale y 
set yrange [-2.500000e-01:5.250000e+00]
set format y "%g"
set format x "%g"
# wrdata format: Col 1=Time, 2=v(1), 3=Time, 4=v(2)
plot 'pulse1_data.txt' using 1:2 with lines lw 1 title "v(1)",\
'pulse1_data.txt' using 3:4 with lines lw 1 title "v(2)"
