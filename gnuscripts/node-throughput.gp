set datafile separator "\t"
set output 'node'.key.'.png'
set terminal pngcairo size 1200,1000 enhanced font 'Verdana,10'

set macros
POS = "at graph 0.5, 1.1 font ',8;'"
XTICS = "set format x '%.0f'; set xlabel 'Time in seconds';"
YTICS = "set format y '%.0f'; set ylabel queue.' - TP bytes/second';"
NOXTICS = "set format x ''; unset xlabel;"
NOYTICS = "set format y ''; unset ylabel;"

TMARGIN = "set tmargin at screen 0.93; set bmargin at screen 0.68;"
VMMARGIN = "set tmargin at screen 0.41; set bmargin at screen 0.66;"
BMARGIN = "set tmargin at screen 0.39; set bmargin at screen 0.14;"

LMARGIN = "set lmargin at screen 0.09; set rmargin at screen 0.36;"
HMMARGIN = " set lmargin at screen 0.38; set rmargin at screen 0.65;"
RMARGIN = "set lmargin at screen 0.67; set rmargin at screen 0.94;"

set multiplot layout 3,3 rowsfirst title "Node ".key." 10s Moving Averages"

set yrange[0:24000]
#
# set xrange [0:100]

set label 1 'BBR' @POS
queue = "Q25"
@NOXTICS @YTICS
@TMARGIN @LMARGIN
plot for [col = 12:21] bbr25 using 1:col with lines notitle

set label 1 'Cubic' @POS
@NOXTICS @NOYTICS
@TMARGIN @HMMARGIN
plot for [col = 12:21] cubic25 using 1:col with lines notitle

set label 1 'NewReno' @POS
@NOXTICS @NOYTICS
@TMARGIN @RMARGIN
plot for [col = 12:21] nr25 using 1:col with lines notitle

unset label
queue = "Q100"
@NOXTICS @YTICS
@VMMARGIN @LMARGIN
plot for [col = 12:21] bbr100 using 1:col with lines notitle

@NOXTICS @NOYTICS
@VMMARGIN @HMMARGIN
plot for [col = 12:21] cubic100 using 1:col with lines notitle

@NOXTICS @NOYTICS
@VMMARGIN @RMARGIN
plot for [col = 12:21] nr100 using 1:col with lines notitle

queue = "Q200"
@XTICS @YTICS
@BMARGIN @LMARGIN
plot for [col = 12:21] bbr200 using 1:col with lines notitle

@XTICS @NOYTICS
@BMARGIN @HMMARGIN
plot for [col = 12:21] cubic200 using 1:col with lines notitle

@XTICS @NOYTICS
@BMARGIN @RMARGIN
plot for [col = 12:21] nr200 using 1:col with lines notitle

unset multiplot
unset macros
