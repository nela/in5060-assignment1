#!/bin/bash

retransmitted=$1
internetstack=$2

awk 'FNR==NR { dups[$NF]; next; } !($33 in dups)' $retransmitted $internetstack
