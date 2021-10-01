#!/bin/bash

# Works only with ...bottleneck.tr files

file=$1

if [ -z $2 ]; then
  moving_avg=10
else
  moving_avg=$2
fi

grep 'Payload' $file | awk -F'[ .]' '
  BEGIN { OFS="\t\t" } {
    if ($1 ~ /-/) {
      deq[$2]+=1
    } else if ($1 ~ /\+/) {
      enq[$2]+=1
    } else if ($1 ~ /r/ ) {
      recv[$2]+=1
    }
  } END {
      print "#Sec","Enq","Deq","Recv","Recv-Deq"
      for (i in deq) print i,enq[i],deq[i],recv[i],deq[i]-recv[i]
  }' | sort -n
