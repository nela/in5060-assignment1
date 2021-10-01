set style data boxplot
set style fill solid 0.25 border -1
set style boxplot outliers pointtype 7
set boxwidth  0.5
set pointsize 0.5

# set xtics ("Bbr" 1, "Cubic" 2, "NewReno" 3) scale 0.0
set yrange[*:*]
set title "Leafnode Throughput Variance Q200"

plot "../parsed_test_results/TcpBbr_1Mbps_200_0/sum-leafnode-sending-rate-and-thtoughput-nonma.dat" using (1):2 notitle, \
       "../parsed_test_results/TcpCubic_1Mbps_200_0/sum-leafnode-sending-rate-and-thtoughput-nonma.dat" using (2):2 notitle, \
       "../parsed_test_results/TcpNewReno_1Mbps_200_0/sum-leafnode-sending-rate-and-thtoughput-nonma.dat" using (3):2 notitle
