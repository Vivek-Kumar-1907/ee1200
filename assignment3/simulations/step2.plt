set terminal pngcairo size 800,600
set output 'step2.png'
set xtics rotate by -45
set encoding utf8
set termoption noenhanced
set title "step signal (discharging)"
set xlabel "s"
set ylabel "V"
set grid
unset logscale x 
set xrange [1.002163e-02:1.200000e-02]
unset logscale y 
set yrange [-5.499976e+00:5.499999e+00]
#set xtics 1
#set x2tics 1
#set ytics 1
#set y2tics 1
set format y "%g"
set format x "%g"
plot 'step2.data' using 1:2 with lines lw 1 title "v(1)",\
'step2.data' using 3:4 with lines lw 1 title "v(2)"
