set title 'Node Throughput Bbr Q200'
set xlabel 'seconds'
set ylabel 'bytes'
plot for [col = 32:41] "../parsed_test_results/TcpBbr_1Mbps_200_0/leafnode-sending-rate-and-throughput.dat" using 1:col notitle with lines
pause -1
