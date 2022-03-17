#!/bin/bash

n=0
while [ $n -le 100 ]
do
  StartTime=$(date +%s)
  echo "$n 번 반복"
  nslookup h00027.vegas-solution.com
  EndTime=$(date +%s)
  echo "It takes $(($EndTime - $StartTime)) seconds to complete this task."
  ((n++))
  sleep 1s
done
