set title 'Node Throughput Bbr Q100'
set xlabel 'seconds'
set ylabel 'bytes'
plot for [col = 32:41] "../parsed_test_results/TcpBbr_1Mbps_100_0/leafnode-sending-rate-and-throughput.dat" using 1:col notitle with lines
pause -1
