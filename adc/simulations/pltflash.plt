# 1. Output Configuration
set terminal pngcairo size 1024,800 enhanced font 'Verdana,12'
set output "flash_adc_results.png"

# 2. Basic Setup
set title "Flash ADC: Linearly increasing Vin vs Digital Outputs"
set xlabel "Time (s)"
unset ylabel 

# 3. Set custom Y-axis ticks for 4 channels
# Assuming v(in) is roughly 0-5V. We will offset it by +30.
set ytics ("D1" 2.5, "D2" 12.5, "D3" 22.5, \
           "0.5V" 31, "1.5V" 33, "2.5V" 35, "3.5V" 37, "4.5V" 39, "5.5V" 41, "6.5V" 43, "7.5V" 45)
# 4. Adjust Y-range for padding across 4 lanes
set yrange [-2:50]

# 5. Add a light grid
set xtics 0.5,1
set mxtics 2
set mytics 2
set grid xtics ytics mxtics mytics lw 3 lc rgb '#999999', lw 2 lc rgb '#cccccc'
set mytics 2 

# 6. Plot the Mixed Signals
# Column 2 (Analog Input) uses 'lines'
# Columns 3, 4, 5 (Digital Outputs) use 'steps'
plot "flashadc.data" using 1:4           with steps linewidth 2 title "D1", \
     "flashadc.data" using 1:($6 + 10)   with steps linewidth 2 title "D2", \
     "flashadc.data" using 1:($8 + 20)   with steps linewidth 2 title "D3", \
     "flashadc.data" using 1:($2 * 2 + 30)   with lines linewidth 2 title "v(in)"

set output
