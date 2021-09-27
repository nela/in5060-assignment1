set title 'Bottleneck Sending Rate Q50'
set xlabel 'seconds'
set ylabel 'bytes'
plot "../parsed_test_results/TcpBbr_1Mbps_50_0/bottleneck-sendingrate-and-throughput.dat" using 1:2 title "Bbr" with lines, \
       "../parsed_test_results/TcpCubic_1Mbps_50_0/bottleneck-sendingrate-and-throughput.dat" using 1:2 title "Cubic" with lines, \
       "../parsed_test_results/TcpNewReno_1Mbps_50_0/bottleneck-sendingrate-and-throughput.dat" using 1:2 title "NewReno" with lines
pause -1