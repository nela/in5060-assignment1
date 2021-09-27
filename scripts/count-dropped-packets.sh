#!/bin/bash

file=$1

sed 's/^ *//' $file | sed 's/^ *//' | sed 's/^ *//' | awk -F'[ .]' '
  BEGIN { OFS="\t\t"} {
    drp[$1]+=1
  } END {
    print "#Sec", "Drp"
    for (i in drp) print i,drp[i]
  }' | sort -n
