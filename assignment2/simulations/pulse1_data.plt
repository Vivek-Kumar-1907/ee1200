set encoding utf8
set termoption noenhanced
set title "500us pulse signal"
set xlabel "s"
set ylabel "V"
set grid
unset logscale x 
set xrange [0.000000e+00:2.000000e-03]
unset logscale y 
set yrange [-2.500000e-01:5.250000e+00]
#set xtics 1
#set x2tics 1
#set ytics 1
#set y2tics 1
set format y "%g"
set format x "%g"
plot 'pulse1_data.data' using 1:2 with lines lw 1 title "v(1)",\
'pulse1_data.data' using 3:4 with lines lw 1 title "v(2)"
