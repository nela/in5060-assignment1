set style data boxplot
set style fill solid 0.25 border -1
set style boxplot outliers pointtype 7
set boxwidth  0.5
set pointsize 0.5

set datafile separator "\t"
# set terminal pngcairo size 1100,1000 enhanced font 'Verdana,10'

set style data boxplot
set style fill solid 0.25 border -1
set style boxplot outliers pointtype 7
set boxwidth  0.5
set pointsize 0.5

set macros
POS = "at graph 0.1, 0.1 font ',8;'"
XTICS = "set xtics('Bbr' 1, 'Cubic' 2, 'NewReno' 3) scale 0.0; unset xlabel;"
YTICS = " set format y '%.1f'; set ylabel 'Fairness index';"
NOXTICS = "set format x ''; set xlabel; set noxtics;"
NOYTICS = "set format y ''; unset ylabel;"
TMARGIN = "set tmargin at screen 0.91; set bmargin at screen 0.56;"
BMARGIN = "set tmargin at screen 0.54; set bmargin at screen 0.18;"
LMARGIN = "set lmargin at screen 0.13; set rmargin at screen 0.53;"
RMARGIN = "set lmargin at screen 0.55; set rmargin at screen 0.95;"

set multiplot layout 2,2 rowsfirst title "Fairness Index Variance in Time"
set yrange [0:1]

set label 1 'Q25' @POS
@YTICS @NOXTICS
@TMARGIN @LMARGIN
plot "parsed_test_results/TcpBbr_1Mbps_25_0/fairness.dat" using (1):12 notitle, \
       "parsed_test_results/TcpCubic_1Mbps_25_0/fairness.dat" using (2):12 notitle, \
       "parsed_test_results/TcpNewReno_1Mbps_25_0/fairness.dat" using (3):12 notitle

set label 1 'Q50' @POS
@NOYTICS @NOXTICS
@TMARGIN @RMARGIN
plot "parsed_test_results/TcpBbr_1Mbps_50_0/fairness.dat" using (1):12 notitle, \
       "parsed_test_results/TcpCubic_1Mbps_50_0/fairness.dat" using (2):12 notitle, \
       "parsed_test_results/TcpNewReno_1Mbps_50_0/fairness.dat" using (3):12 notitle

set label 1 'Q100' @POS
@YTICS @XTICS
@BMARGIN @LMARGIN
plot "parsed_test_results/TcpBbr_1Mbps_100_0/fairness.dat" using (1):12 notitle, \
       "parsed_test_results/TcpCubic_1Mbps_100_0/fairness.dat" using (2):12 notitle, \
       "parsed_test_results/TcpNewReno_1Mbps_100_0/fairness.dat" using (3):12 notitle

set label 1 'Q200' @POS
@NOYTICS @XTICS
@BMARGIN @RMARGIN
plot "parsed_test_results/TcpBbr_1Mbps_200_0/fairness.dat" using (1):12 notitle, \
       "parsed_test_results/TcpCubic_1Mbps_200_0/fairness.dat" using (2):12 notitle, \
       "parsed_test_results/TcpNewReno_1Mbps_200_0/fairness.dat" using (3):12 notitle

unset label
unset macros
unset multiplot

pause -1

