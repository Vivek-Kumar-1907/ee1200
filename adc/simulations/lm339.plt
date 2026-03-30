set encoding utf8
set termoption noenhanced
set title "3-bit flash adc"
set xlabel "s"
set ylabel "V"
set grid
unset logscale x 
set xrange [0.000000e+00:8.000000e+00]
unset logscale y 
set yrange [-4.000000e-01:8.400000e+00]
#set xtics 1
#set x2tics 1
#set ytics 1
#set y2tics 1
set format y "%g"
set format x "%g"
plot 'lm339.data' using 1:2 with lines lw 1 title "v(in)",\
'lm339.data' using 3:4 with lines lw 1 title "v(outout1)",\
'lm339.data' using 5:6 with lines lw 1 title "v(outout2)",\
'lm339.data' using 7:8 with lines lw 1 title "v(outout3)"
