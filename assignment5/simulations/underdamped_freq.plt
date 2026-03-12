set encoding utf8
set termoption noenhanced
set title "frequency response - underdamped"
set xlabel "Hz"
set ylabel "dB"
set grid
set logscale x
set xrange [1e+00:1e+05]
set mxtics 10
set grid mxtics
unset logscale y 
set yrange [-2.172946e+01:1.435098e+01]
#set xtics 1
#set x2tics 1
#set ytics 1
#set y2tics 1
set format y "%g"
set format x "%g"
plot 'underdamped_freq.data' using 1:2 with lines lw 1 title "db(v(1))"
