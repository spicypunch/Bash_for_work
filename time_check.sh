#!/bin/bash

n=0
while [ $n -le 100 ]
do
  #명령어 수행 시간 테스트
  StartTime=$(date +%s)
  echo "$n 번 반복"
  
  #사용할 명령어 기입
  nslookup example.com
  EndTime=$(date +%s)
  
  #명령어 수행 시간 결과 출력
  echo "It takes $(($EndTime - $StartTime)) seconds to complete this task."
  
  ((n++))
  #1초 지나고 다시 반복
  sleep 0.5s
done
