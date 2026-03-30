set encoding utf8
set termoption noenhanced
set title "1-bit flash adc"
set xlabel "s"
set ylabel "V"
set grid
unset logscale x 
set xrange [2.970003e+00:3.000000e+00]
unset logscale y 
set yrange [-2.500000e-01:5.250000e+00]
#set xtics 1
#set x2tics 1
#set ytics 1
#set y2tics 1
set format y "%g"
set format x "%g"
plot 'ua741.data' using 1:2 with lines lw 1 title "v(high)",\
'ua741.data' using 3:4 with lines lw 1 title "v(out)",\
'ua741.data' using 5:6 with lines lw 1 title "v(low)"
