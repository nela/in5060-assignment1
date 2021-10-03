#!/bin/bash

key=$1

gnuplot -e "g25='parsed_test_results/Tcp${key}_1Mbps_25_0/goodput-and-moving-average.dat'" \
  -e "g50='parsed_test_results/Tcp${key}_1Mbps_50_0/goodput-and-moving-average.dat'" \
  -e "g100='parsed_test_results/Tcp${key}_1Mbps_100_0/goodput-and-moving-average.dat'" \
  -e "g200='parsed_test_results/Tcp${key}_1Mbps_200_0/goodput-and-moving-average.dat'" \
  -e "t25='parsed_test_results/Tcp${key}_1Mbps_25_0/throughput-and-moving-avg.dat" \
  -e "t50='parsed_test_results/Tcp${key}_1Mbps_50_0/throughput-and-moving-avg.dat" \
  -e "t100='parsed_test_results/Tcp${key}_1Mbps_100_0/throughput-and-moving-avg.dat" \
  -e "t200='parsed_test_results/Tcp${key}_1Mbps_200_0/throughput-and-moving-avg.dat" \
  -e "key='${key}'" gnuscripts/goodput-box.gp
