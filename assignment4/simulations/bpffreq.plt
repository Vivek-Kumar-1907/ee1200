set encoding utf8
set termoption noenhanced
set title "band pass frequency response"
set xlabel "Hz"
set ylabel "dB"
set grid
set logscale x
set xrange [1e+03:1e+06]
set mxtics 10
set grid mxtics
unset logscale y 
set yrange [-2.340212e+01:5.762584e+00]
#set xtics 1
#set x2tics 1
#set ytics 1
#set y2tics 1
set format y "%g"
set format x "%g"
plot 'bpffreq.data' using 1:2 with lines lw 1 title "db(v(2))"
