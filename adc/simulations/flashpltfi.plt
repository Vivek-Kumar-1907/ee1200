# 1. Output Configuration
set terminal pngcairo size 1024,800 enhanced font 'Verdana,12'
set output "flash_adc_results.png"

# 2. Basic Setup
set title "Flash ADC: Linearly increasing Vin vs Digital Outputs"
set xlabel "Time (s)"
set ylabel "Voltage (V) / Digital State (0-7)"

# 3. Set standard Y-axis ticks for the 0 to 8 range
set ytics 1
set yrange [-1:9]

# 4. Add a light grid
set mxtics 2
set mytics 2
set grid xtics ytics mxtics mytics lw 3 lc rgb '#999999', lw 2 lc rgb '#cccccc'

# 5. Plot the Signals
# Col 2 is v(in). 
# We use the safe ternary operator to convert logic levels (> 2.0V) to integer weights.
# D3 (Col 8) adds 4. D2 (Col 6) adds 2. D1 (Col 4) adds 1.
plot "flashadc.data" using 1:2 with lines linewidth 2 title "v(in)", \
     "flashadc.data" using 1:( ($8 > 2.0 ? 4.0 : 0.0) + ($6 > 2.0 ? 2.0 : 0.0) + ($4 > 2.0 ? 1.0 : 0.0) ) with steps linewidth 2 title "Staircase (D3 D2 D1)"

set output
