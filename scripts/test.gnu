
set title 'sending rate & throughput'
set xlabel 'seconds'
set ylabel 'bytes'
plot file using 2:3 with lines
pause -1
