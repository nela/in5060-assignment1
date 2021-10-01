#!/bin/bash

# Works only with ..internetstack.tr files

file=$1

cut -d ' ' -f1,3,24-26,31,33 $file |
  awk '$1 ~/r/' |
  sort |
  uniq -c |
  sed 's/^ *//' |
  awk '$1 > 1 { print $8 }'
