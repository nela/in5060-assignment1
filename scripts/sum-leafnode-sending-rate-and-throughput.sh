#!/bin/bash

file=$1

awk '
  BEGIN { FS=OFS="\t" }
  {
    send[$1]=($2+$3+$4+$5+$6+$7+$8+$9+$10+$11)/10
    recv[$1]=($12+$13+$14+$15+$16+$17+$18+$19+$20+$2h1)/10
  }
  END {
    for (i in send) {
      print i,send[i],recv[i]
    }
  }' $file | sort -n
