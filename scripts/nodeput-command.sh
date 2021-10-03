#!/bin/bash

key=$1
bbr="Bbr"
cubic="Cubic"
nr="NewReno"

gnuplot -e "bbr25='parsed_test_results/Tcp${bbr}_1Mbps_25_0/throughput-and-moving-avg.dat'" \
  -e "bbr100='parsed_test_results/Tcp${bbr}_1Mbps_100_0/throughput-and-moving-avg.dat'" \
  -e "bbr200='parsed_test_results/Tcp${bbr}_1Mbps_200_0/throughput-and-moving-avg.dat'" \
  -e "cubic25='parsed_test_results/Tcp${cubic}_1Mbps_25_0/throughput-and-moving-avg.dat'" \
  -e "cubic100='parsed_test_results/Tcp${cubic}_1Mbps_100_0/throughput-and-moving-avg.dat'" \
  -e "cubic200='parsed_test_results/Tcp${cubic}_1Mbps_200_0/throughput-and-moving-avg.dat'" \
  -e "nr25='parsed_test_results/Tcp${nr}_1Mbps_25_0/throughput-and-moving-avg.dat'" \
  -e "nr100='parsed_test_results/Tcp${nr}_1Mbps_100_0/throughput-and-moving-avg.dat'" \
  -e "nr200='parsed_test_results/Tcp${nr}_1Mbps_200_0/throughput-and-moving-avg.dat'" \
  -e "key='Throughput'" gnuscripts/node-throughput.gp

