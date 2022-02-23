#!/bin/bash

echo -n "접속할 구조를 입력해주세요:  "
read  subdomain
echo "입력한 값 : $subdomain"
ssh vegas@$subdomain.example.com # example 대신 본인 환경에 맞는 도메인 입력