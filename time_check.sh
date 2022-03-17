#!/bin/bash

n=0
while [ $n -le 100 ]
do
  #명령어 수행 시간 테스트
  StartTime=$(date +%s)
  
  echo "$n 번째 실행"
  
  #사용할 명령어 기입
  nslookup example.com
  
  EndTime=$(date +%s)
  
  #명령어 수행 시간 결과 출력
  echo -e "명령어를 실행하는데 총 $(($EndTime - $StartTime))초 걸렸습니다.\n"
  
  #특정 시간이 지날 때만 확인하고 싶을 때 조건문
  if [ $(($EndTime - $StartTime)) -ge 5 ]; then
    echo -e 명령어를 실행하는데 총 $(($EndTime - $StartTime))초 걸렸습니다.\n"
  fi
  
  ((n++))
  #0.5초 지나고 다시 반복
  sleep 0.5s
done
