set encoding utf8
set termoption noenhanced
set title "integrating adc"
set xlabel "s"
set ylabel "V"
set grid
unset logscale x 
set xrange [1.000000e-08:4.010376e-02]
unset logscale y 
set yrange [-4.569376e+00:5.455685e+00]
#set xtics 1
#set x2tics 1
#set ytics 1
#set y2tics 1
set format y "%g"
set format x "%g"
plot 'intadc.data' using 1:2 with lines lw 1 title "v(vo)",\
'intadc.data' using 3:4 with lines lw 1 title "v(compo2)"
