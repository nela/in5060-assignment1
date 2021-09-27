set title 'Bottleneck Throughput Q100'
set xlabel 'seconds'
set ylabel 'bytes'
plot "../parsed_test_results/TcpBbr_1Mbps_100_0/bottleneck-sendingrate-and-throughput.dat" using 1:3 title "Bbr" with lines, \
       "../parsed_test_results/TcpCubic_1Mbps_100_0/bottleneck-sendingrate-and-throughput.dat" using 1:3 title "Cubic" with lines, \
       "../parsed_test_results/TcpNewReno_1Mbps_100_0/bottleneck-sendingrate-and-throughput.dat" using 1:3 title "NewReno" with lines
pause -1
