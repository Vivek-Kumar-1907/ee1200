set terminal pngcairo size 800,600
set output 'sq1_steady.png'
set encoding utf8
set termoption noenhanced
set title "Square Wave 8.2us (Steady - Zoomed)"
set xlabel "s"
set ylabel "V"
set grid
unset logscale x 
# Zoom on the last ~20us
set xrange [4.980000e-03:5.000000e-03]
unset logscale y 
set yrange [2.490000:2.510000]
set format y "%g"
set format x "%g"
# wrdata format: Col 1=Time, 2=v(1), 3=Time, 4=v(2)
plot 'sq1_steady.txt' using 1:2 with lines lw 1 title "v(1)",\
'sq1_steady.txt' using 3:4 with lines lw 1 title "v(2)"
