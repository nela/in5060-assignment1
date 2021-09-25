#!/bin/bash

file=$1

sed 's/^ *//' $file | awk -F'[ .]' '
  {
    s[$1]+=$6;
  }
  END {
    for (k in s) {
     print k, s[k];
    }
  }
' | sort -V
