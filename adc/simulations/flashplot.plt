set terminal pngcairo size 1024,768 enhanced font 'Verdana,12'
set output "digital_signals.png"

# 1. Basic Setup
set title "Ngspice Output: 3-Channel Digital Signals"
set xlabel "Time (s)"
unset ylabel 

# 2. Set custom Y-axis ticks
# Instead of showing the offset numbers, we replace them with the channel names
# Centering the label at the midpoint of each 0-5V swing (2.5, 12.5, 22.5)
set ytics ("CH1" 2.5, "CH2" 12.5, "CH3" 22.5)

# 3. Adjust Y-range for padding
# CH1: 0-5 | CH2: 10-15 | CH3: 20-25
set yrange [-2:28]

# 4. Add a light grid to easily track timing alignments across channels
set grid ytics mytics xtics
set mytics 2 # Adds a tick mark for the high/low states

# 5. Plot the data using 'steps' and mathematical offsets
# 'with steps' ensures you get sharp 90-degree digital transitions instead of sloped lines
plot "flashadc.data" using 1:2           with steps linewidth 2 title "Output 1", \
     "flashadc.data" using 1:($3 + 10)   with steps linewidth 2 title "Output 2", \
     "flashadc.data" using 1:($4 + 20)   with steps linewidth 2 title "Output 3"

set output
