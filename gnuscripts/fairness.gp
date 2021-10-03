set datafile separator "\t"
# set terminal pngcairo size 1100,1000 enhanced font 'Verdana,10'

set macros
POS = "at graph 0.2, 0.15 font ',8;'"
XTICS = "set format x '%.0f'; set xlabel 'Time in seconds';"
YTICS = " set format y '%.1f'; set ylabel 'Fairness index pr sec';"
NOXTICS = "set format x ''; unset xlabel;"
NOYTICS = "set format y ''; unset ylabel;"
TMARGIN = "set tmargin at screen 0.91; set bmargin at screen 0.56;"
BMARGIN = "set tmargin at screen 0.54; set bmargin at screen 0.18;"
LMARGIN = "set lmargin at screen 0.13; set rmargin at screen 0.53;"
RMARGIN = "set lmargin at screen 0.55; set rmargin at screen 0.95;"

set multiplot layout 2,2 rowsfirst title "Fairness Index in time"

# set yrange[0.0:1.0]
# set xrange [0:100]

set key right bottom
set label 1 'Q25' @POS
@NOXTICS @YTICS
@TMARGIN @LMARGIN
plot "parsed_test_results/TcpBbr_1Mbps_25_0/fairness.dat" using 1:12 with lines title "Bbr", \
       "parsed_test_results/TcpCubic_1Mbps_25_0/fairness.dat" using 1:12 with lines title "Cubic", \
       "parsed_test_results/TcpNewReno_1Mbps_25_0/fairness.dat" using 1:12 with lines title "NewReno"

set label 1 'Q50' @POS
@NOXTICS @NOYTICS
@TMARGIN @RMARGIN
plot "parsed_test_results/TcpBbr_1Mbps_50_0/fairness.dat" using 1:12 with lines title "Bbr", \
       "parsed_test_results/TcpCubic_1Mbps_50_0/fairness.dat" using 1:12 with lines title "Cubic", \
       "parsed_test_results/TcpNewReno_1Mbps_50_0/fairness.dat" using 1:12 with lines title "NewReno"

set label 1 'Q100' @POS
@XTICS @YTICS
@BMARGIN @LMARGIN
plot "parsed_test_results/TcpBbr_1Mbps_100_0/fairness.dat" using 1:12 with lines title "Bbr", \
       "parsed_test_results/TcpCubic_1Mbps_100_0/fairness.dat" using 1:12 with lines title "Cubic", \
       "parsed_test_results/TcpNewReno_1Mbps_100_0/fairness.dat" using 1:12 with lines title "NewReno"

set label 1 'Q200' @POS
@XTICS @NOYTICS
@BMARGIN @RMARGIN
plot "parsed_test_results/TcpBbr_1Mbps_200_0/fairness.dat" using 1:12 with lines title "Bbr", \
       "parsed_test_results/TcpCubic_1Mbps_200_0/fairness.dat" using 1:12 with lines title "Cubic", \
       "parsed_test_results/TcpNewReno_1Mbps_200_0/fairness.dat" using 1:12 with lines title "NewReno"

unset macros
unset multiplot

pause -1

