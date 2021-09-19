#!/bin/bash
awk 'NR==FNR{a[$13];next} $19 in a{print $0 }' $1 $2

awk 'NR==FNR{a[$13];next} END { for (k in a) { print k;} }' $1 $2 | sort
