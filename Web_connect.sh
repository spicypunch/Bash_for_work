#!/bin/bash
# 각 Web서버로 바로 연결할 수 있는 스크립트
while :
do
echo -n "접속할 구조의 번호를 입력해주세요:  "
read  num
echo "입력한 번호: $num"
if [ $num -eq 1 ];then
    ssh -i key.pem centos@IPAddress
    break

elif [ $num -eq 3 ];then
    ssh -i key.pem centos@IPAddress
    break

elif [ $num -eq 5 ];then
    ssh -i key.pem centos@IPAddress
    break

elif [ $num -eq 7 ];then
    ssh -i key.pem centos@IPAddress
    break

elif [ $num -eq 9 ];then
    ssh -i key.pem centos@IPAddress
    break

elif [ $num -eq 11 ];then
    ssh -i key.pem centos@IPAddress
    break

elif [ $num -eq 13 ];then
    ssh -i key.pem centos@IPAddress
    break

elif [ $num -eq 15 ];then
    ssh -i key.pem centos@IPAddress
    break
else
    echo -e "없는 번호입니다.\n"
fi
done