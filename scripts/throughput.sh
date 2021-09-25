#!/bin/bash

file=$1
node=$2

cat $file | grep /NodeList/$2 | grep Payload | awk -F'[ .]' '
  {
    $1 ~ /r/
    s[$2]+=1024;
  }
  END {
    for (key in s) {
      print key, s[key];
    }
  }
' | sort -V
