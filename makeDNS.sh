#!/bin/bash

echo -n "생성할 도메인을 입력하시오 : "
read domain
echo -n "생성할 ip를 입력하시오 : "
read ip
echo -n "1. domain1   2. domain2 : "
read num

#네임 서버 도메인을 dns1, dns2, dns3을 붙여서 관리하고 있음
if [ $num -eq 1 ]; then
  for i in $(seq 1 3); do
    sshpass -p passwd ssh root@dns$i.dnsserver.com "mysql -uroot -p passwd -e 'use pdns; INSERT INTO records (domain_id, name, type, content, ttl, prio, change_date, disabled, ordername, auth    ) VALUES (11, '\''$domain'\'.domain1.com', '\''A'\'', '\''$ip'\'', 10, NULL, NULL, 0, NULL, 1);'"
  done

elif [ $num -eq 2 ]; then
  for i in $(seq 1 3); do
    sshpass -p passwd ssh root@dns$i.dnsserver.com "mysql -uroot -p passwd -e 'use pdns; INSERT INTO records (domain_id, name, type, content, ttl, prio, change_date, disabled, ordername, auth    ) VALUES (14, '\''$domain'\'.domain2.com', '\''A'\'', '\''$ip'\'', 10, NULL, NULL, 0, NULL, 1);'"
  done
fi
~
