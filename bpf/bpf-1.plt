set encoding utf8
set termoption noenhanced
set title "band pass filter design"
set xlabel "s"
set grid
unset logscale x 
set xrange [9.988100e-01:1.000000e+00]
unset logscale y 
set yrange [-7.680954e+00:7.676378e+00]
#set xtics 1
#set x2tics 1
#set ytics 1
#set y2tics 1
set format y "%g"
set format x "%g"
plot 'bpf-1.data' using 1:2 with lines lw 1 title "vin",\
'bpf-1.data' using 3:4 with lines lw 1 title "5*v(2)"
