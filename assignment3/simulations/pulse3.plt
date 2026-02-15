set terminal pngcairo size 800,600
set output 'pulse3.png'
set encoding utf8
set termoption noenhanced
set title "16ms Pulse Signal"
set xlabel "s"
set ylabel "V"
set grid
unset logscale x 
set xrange [0.000000e+00:2.000000e-02]
unset logscale y 
set yrange [-6.000000e+00:6.000000e+00]
set format y "%g"
set format x "%g"
plot 'pulse3_data.txt' using 1:2 with lines lw 1 title "v(1)",\
'pulse3_data.txt' using 3:4 with lines lw 1 title "v(2)"
