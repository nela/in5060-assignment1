#!/bin/bash

file=$1

clients=10
moving_avg=10
res=""

# for i in $(seq 1 $clients); do
#   f1="$( grep DeviceList/${i}/ $file | grep Dequeue | cut -d ' ' -f3,29-31,36,38 | sort | uniq -c | awk '$1 > 1' )"
#   f2="$( grep DeviceList/${i}/ $file | grep Dequeue)"
#
#   tmp="$( awk -F'[ .]' -vn=$i '
#     NR==FNR { dupes[$NF]; next; }
#     !($45 in dupes) && !($43 ~ /SYN/) { good[$2]+=1024 }
#     END {
#       print "#S"n
#       for (j in good) print j,good[j] }
#   ' <(echo "$f1") <(echo "$f2") | sort -n)"
#
#   res+="$tmp"$'\n'
# done


# f="$( grep DeviceList/2 $file | grep Dequeue )"
#
# awk -F'[ .]' -vn=$i '
#   !($43 ~ /SYN/) {
#       through[$2]+=1024;
#     } END {
#       print "#S"n
#       for (i in through) print(i),through[i]
#     }
#   ' <(echo "$f") | sort -n

for i in $(seq 1 $clients); do
  f="$( grep DeviceList/${i} $file | grep Dequeue )"

  tmp="$( awk -F'[ .]' -vn=$i '
  !($43 ~ /SYN/) { through[$2]+=1024; } END {
      print "#S"n
      for (i in through) print(i),through[i]
    }
  ' <(echo "$f") | sort -n)"

  res+="$tmp"$'\n'
done

awk -v OFS="\t" -v h="#Sec" '
  NF == 1 {
    h = h OFS substr($1, 2)
    ++numSec
    next
  } {
    keys[$1]
    map[$1,numSec] = $2
  } END {
    print h
    for (k in keys) {
      printf "%s", k
      for (i=1; i<=numSec; ++i)
        printf "\t%s", map[k,i]
      print ""
    }
  }' <(echo "$res") | sort -n | sed '/^[[:space:]]*$/d' |
  awk -vn=$moving_avg '
    BEGIN { FS=OFS="\t"; m = int((n + 1)/2); }
    NR==1 {
      first = $0
      for (g=2; g<=NF; g++) first = first FS "M"$g
      next
    } {
      for (i = 2; i <= NF; ++i) {
        arr[NR-1,i]=$i
        sum[i]+=$i
      }
    } (NR-1) < m {
      sstr=""
      for (wi = 1; wi <= NF-1; ++wi) { sstr = FS sstr }
      noavg[++h] = $0 sstr
    } (NR-1) >= m {
      d[NR-1] = $0
    } (NR-1) > n {
      for (k = 2; k<=NF; ++k) sum[k]-=arr[NR-m,k];
    } (NR-1) >= n {
      for (l = 2; l <= NF; ++l) arrc[NR-m,l]=sum[l]/n;
    } END {
      print first
      for (q in noavg) print noavg[q]
      for (p = m; p <= (NR-1); ++p) {
        str=arrc[p,2]
        for (t = 3; t <= NF; ++t) { str = str FS arrc[p,t] }
        print d[p] FS str
      }
    }' | awk -vc=$clients -vn=$moving_avg '
    BEGIN { FS=OFS="\t"; m = int((n +1)/2); }
    NR==1 {
      first = $0 FS "TP-Mean" FS "TP-Ma-Mean"
      next;
    } {
      data[NR] = $0
      streamSum=0;
      maSum=0;
      for (i = 2; i <= int((NF/2) + 1); ++i) streamSum+=$i;
      for (j = 12; j <= NF; ++j) maSum+=$j;
      rowStreamSum[NR]=streamSum/c;
      rowMaSum[NR]=maSum/c;
    } END {
      print first;
      for (r in data) print data[r],rowStreamSum[r],rowMaSum[r]
    }' | sort -n
# awk -vc=$clients '
#     BEGIN { FS=OFS="\t"; ln=-1; } NR == 1 { print $0; next; }
#     {
#       while (++ln != $1) {
#         str=""
#         for (i = 0; i < c-1; i++) { str = str FS }
#         print ln,str
#       }
#     } 1' |
