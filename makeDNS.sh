#!/bin/bash

echo -n "생성할 쿼리를 입력하시오 : "
read query

#네임 서버 도메인을 dns1, dns2, dns3을 붙여서 관리하고 있음
for i in $(seq 1 3); do
    ssh root@dns$i.domain.com "mysql -uroot -ppasswd -e 'use dpns; $query'"
done
