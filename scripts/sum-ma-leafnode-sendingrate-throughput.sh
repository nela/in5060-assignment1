#!/bin/bash

file=$1

awk '
  BEGIN { FS=OFS="\t" }
  {
    send[$1]=($22+$23+$24+$25+$26+$27+$28+$29+$30+$31)/10
    recv[$1]=($32+$33+$34+$35+$36+$37+$38+$39+$40+$41)/10
  }
  END {
    for (i in send) {
      print i,send[i],recv[i]
    }
  }' $file | sort -n
