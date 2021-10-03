#!/bin/bash

key=$1

gnuplot -e "g25='parsed_test_results/Tcp${key}_1Mbps_25_0/goodput-and-moving-average.dat'" \
  -e "t25='parsed_test_results/Tcp${key}_1Mbps_25_0/throughput-and-moving-avg.dat'" \
  # -e "c25='parsed_test_results/Tcp${key}_1Mbps_25_0/cwnd.dat'" \
  -e "g50='parsed_test_results/Tcp${key}_1Mbps_50_0/goodput-and-moving-average.dat'" \
  -e "t50='parsed_test_results/Tcp${key}_1Mbps_50_0/throughput-and-moving-avg.dat'" \
  # -e "c50='parsed_test_results/Tcp${key}_1Mbps_50_0/cwnd.dat'" \
  -e "g100='parsed_test_results/Tcp${key}_1Mbps_100_0/goodput-and-moving-average.dat'" \
  -e "t100='parsed_test_results/Tcp${key}_1Mbps_100_0/throughput-and-moving-avg.dat'" \
  # -e "c100='parsed_test_results/Tcp${key}_1Mbps_100_0/cwnd.dat'" \
  -e "g200='parsed_test_results/Tcp${key}_1Mbps_200_0/goodput-and-moving-average.dat'" \
  -e "t200='parsed_test_results/Tcp${key}_1Mbps_200_0/throughput-and-moving-avg.dat'" \
  # k-e "c200='parsed_test_results/Tcp${key}_1Mbps_200_0/cwnd.dat'" \
  -e "key='${key}'" gnuscripts/goodput.gp
