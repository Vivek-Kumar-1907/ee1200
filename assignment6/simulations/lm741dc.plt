set encoding utf8
set termoption noenhanced
set title "lm741 with ac input v1 = 3.0, v2 = 1.5"
set xlabel "s"
set ylabel "V"
set grid
unset logscale x 
set xrange [-1.000000e+00:1.000000e+00]
unset logscale y 
set yrange [-2.641674e+00:7.075163e+00]
#set xtics 1
#set x2tics 1
#set ytics 1
#set y2tics 1
set format y "%g"
set format x "%g"
plot 'lm741dc.data' using 1:2 with lines lw 1 title "v(v1_n)",\
'lm741dc.data' using 3:4 with lines lw 1 title "v(v2_n)",\
'lm741dc.data' using 5:6 with lines lw 1 title "v(vout)"
