#!/bin/bash

file=$1

if [ -z $2 ]; then
  moving_avg=10
else
  moving_avg=$2
fi

grep -E '/NodeList/0/|/NodeList/1/' $file | grep Payload |
  awk -F'[ .]' '
    BEGIN { OFS="\t" } {
      if ($1 ~ /t/ && $4 ~ /\/NodeList\/0/) {
        sent[$2]+=1024
      } else if ($1 ~ /r/ && $4 ~/\/NodeList\/1/) {
        recv[$2]+=1024
      }
    } END {
      for (i in sent) {
        print i,sent[i],recv[i];
      }
    }' | sort -V |
  awk -vn=$moving_avg '
      BEGIN { FS=OFS="\t"; m = int((n + 1)/2) } {
        a[NR]=$2; asum+=$2;
        b[NR]=$3; bsum+=$3;
      } NR < m {
        print $0 FS FS
      } NR >= m {
        d[++i] = $0
      } NR > n {
        asum-=a[NR-n]
        bsum-=b[NR-n]
      } NR >= n {
        ac[++k]=asum/n
        bc[++r]=bsum/n
      } END {
        for (j=1; j<=k+(n-m); j++) print d[j],ac[j],bc[j]
      }'
