set title 'sending rate & throughput'
set xlabel 'seconds'
set ylabel 'bytes'
plot for [col = 2:5] file using 1:col with lines
pause -1
