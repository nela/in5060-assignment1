
set title 'qlen'
set xlabel 'seconds'
set ylabel 'packets'
plot 'test.dat' using 1:5 notitle with lines
