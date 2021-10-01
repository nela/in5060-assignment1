#!/bin/bash

file=$1

cut -d ' ' -f1,3,24-26 $file | awk '$1 ~/r/' | cut -d ' ' -f2 | sort | uniq
