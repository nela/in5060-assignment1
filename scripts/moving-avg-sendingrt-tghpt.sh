#!/bin/bash

file=$1

grep -E '/NodeList/0/|/NodeList/1/' $file | grep Payload |
  awk '
    { a[NR]=$2; sum+=$2 } NR'
