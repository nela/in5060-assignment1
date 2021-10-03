set datafile separator "\t"
set output key.'-throughput-goodput.png'
set terminal pngcairo size 1200,1000 enhanced font 'Verdana,10'

set macros
POS = "at graph 0.5, 0.9 font ',8;'"
XTICS = "set format x '%.0f'; set xlabel 'Time in seconds';"
YTICS = "set format y '%.0f'; set ylabel 'Throughput in bytes/second';"
NOXTICS = "set format x ''; unset xlabel;"
NOYTICS = "set format y ''; unset ylabel;"
TMARGIN = "set tmargin at screen 0.91; set bmargin at screen 0.56;"
BMARGIN = "set tmargin at screen 0.54; set bmargin at screen 0.18;"
LMARGIN = "set lmargin at screen 0.13; set rmargin at screen 0.53;"
RMARGIN = "set lmargin at screen 0.55; set rmargin at screen 0.95;"

set multiplot layout 2,2 rowsfirst title "Tcp".key.": Throughput and Goodput 10s Moving Averages"

set yrange[0:12000]
# set xrange [0:100]

set label 1 'Q25' @POS
@NOXTICS @YTICS
@TMARGIN @LMARGIN
plot g25 using 1:23 with lines title 'goodput', \
       t25 using 1:23 with lines title 'throughput', \
       c25 using 1:2 with lines title 'cwnd'


set label 1 'Q50' @POS
@NOXTICS @NOYTICS
@TMARGIN @RMARGIN
plot g50 using 1:23 with lines title 'goodput', \
       t50 using 1:23 with lines title 'throughput', \
       c50 using 1:2 with lines title 'cwnd'

set label 1 'Q100' @POS
@XTICS @YTICS
@BMARGIN @LMARGIN
plot g100 using 1:23 with lines title 'goodput', \
       t100 using 1:23 with lines title 'throughput', \
       c100 using 1:2 with lines title 'cwnd'


set label 1 'Q200' @POS
@XTICS @NOYTICS
@BMARGIN @RMARGIN
plot g200 using 1:23 with lines title 'goodput', \
       t200 using 1:23 with lines title 'throughput', \
       c200 using 1:2 with lines title 'cwnd'

unset multiplot
unset macros
