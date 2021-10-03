set style data boxplot
set style fill solid 0.25 border -1
set style boxplot outliers pointtype 7
set boxwidth  0.5
set pointsize 0.5

set datafile separator "\t"
set output key.'-throughput-goodput-boxplot.png'
set terminal pngcairo size 1200,1000 enhanced font 'Verdana,10'

set macros
POS = "at graph 0.5, 0.9 font ',8;'"
XTICS = "set format x '%.0f'; set xtics('Throughput' 1, 'Goodput' 2) scale 0.0;"
YTICS = "set format y '%.0f'; set ylabel 'Throughput in bytes/second';"
NOXTICS = "set format x ''; unset xlabel; set noxtics;"
NOYTICS = "set format y ''; unset ylabel;"
TMARGIN = "set tmargin at screen 0.91; set bmargin at screen 0.56;"
BMARGIN = "set tmargin at screen 0.54; set bmargin at screen 0.18;"
LMARGIN = "set lmargin at screen 0.13; set rmargin at screen 0.53;"
RMARGIN = "set lmargin at screen 0.55; set rmargin at screen 0.95;"

set multiplot layout 2,2 rowsfirst title "Tcp".key.": Throughput and Goodput Node 10s Moving Average Variance"

set yrange[0:15000]
# set xrange [0:100]

set label 1 'Q25' @POS
@NOXTICS @YTICS
@TMARGIN @LMARGIN
plot t25 using (1):22 notitle, g25 using (2):22 notitle


set label 1 'Q50' @POS
@NOXTICS @NOYTICS
@TMARGIN @RMARGIN
plot t50 using (1):22 notitle, g50 using (2):22 notitle

set label 1 'Q100' @POS
@XTICS @YTICS
@BMARGIN @LMARGIN
plot t100 using (1):22 notitle, g100 using (2):22 notitle


set label 1 'Q200' @POS
@XTICS @NOYTICS
@BMARGIN @RMARGIN
plot t200 using (1):22 notitle, g200 using (2):22 notitle

unset multiplot
unset macros
