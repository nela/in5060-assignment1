#!/bin/bash

file=$1

optimal_fairness=13107
clients=10

algo=( "Bbr" "Cubic" "NewReno" )
queue=( "25" "50" "100" "200" )


# for i in "${algo[@]}"; do
#   for j in "${queue[@]}"; do
#
#     # echo "parsed_test_results/Tcp${i}_1Mbps_${j}_0/fairness.dat"
#     file="parsed_test_results/Tcp${i}_1Mbps_${j}_0/throughput-and-moving-avg.dat"
#     echo $file
#
    awk -vc=$clients -vo=$optimal_fairness '
      BEGIN {
        FS=OFS="\t";
        first = "#Sec"
        for (k = 1; k <= c; ++k) first = first FS "S"k
        print first;
      }
      NR == 1 {
        next;
      } {
        str = $1
        for (i = 2; i <= (c + 1); ++i) {
          length($i) == 0 ? intermediate_key[$1, i] = 0 : intermediate_key[$1, i] = $i/o
          str = str FS intermediate_key[$1, i]
        }
        print str
      } ' $file | sort -n | awk -vc=$clients '
      BEGIN { FS=OFS="\t"; }
      NR == 1 {
        first = $0;
        next;
      } {
        row[m++] = $0
        numerator = 0;
        denominator = 0;
        for (i = 2; i <= NF; ++i) {
          numerator += $i
          denominator += $i**2
        }
        fairness_ps[$1] = (numerator**2)/(c * denominator)
      } END {
        print first FS "Fairness ps"
        for (r in row) print row[r],fairness_ps[r]
      } ' | sort -n #> parsed_test_results/Tcp${i}_1Mbps_${j}_0/fairness.dat
#   done
# done

# | awk ' BEGIN {FS=OFS="\t" }{print $1, $NF}' | sort -n

# # for (k in intermediate_key) {
# #   split (k, sep, SUBSEP);
# #
# #   print "hey"
# #
# #   print sep[1], sep[2], intermediate_key[sep[1], sep[2]]
# #   # for (j = 2; j <= (c + 1); ++j) print sep[1], sep[j], intermediate_key[sep[1], sep[j]]
# # }
