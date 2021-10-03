#!/bin/bash

file=$1

awk 'NR > 1 { sum += $12 } END { res=sum/100; print res; }' $file
