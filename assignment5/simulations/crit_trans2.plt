set encoding utf8
set termoption noenhanced
set title "transient response: damping ratio = 0.8"
set xlabel "s"
set ylabel "V"
set grid
unset logscale x 
set xrange [0.000000e+00:1.000000e-04]
unset logscale y 
set yrange [-2.541927e-01:5.338046e+00]
#set xtics 1
#set x2tics 1
#set ytics 1
#set y2tics 1
set format y "%g"
set format x "%g"
plot 'crit_trans2.data' using 1:2 with lines lw 1 title "v(1)",\
'crit_trans2.data' using 3:4 with lines lw 1 title "v(3)"
