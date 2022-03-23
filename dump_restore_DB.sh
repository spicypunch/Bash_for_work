#!/bin/bash

echo -n "생성할 DB 명을 입력하시오 : "
read db_name

echo -n "DB를 가져올 서버의 번호를 입력하시오 [ex)vc3, hc1] : "
read server_name

if [[ ${server_name:0:2} == "vc" ]]; then
  sshpass -f passwd.txt ssh vegas@$server_name.vegas-solution.com "mysqldump -uroot -p!mgrsol123 $db_name > $db_name.sql"
  sshpass -f passwd.txt ssh vegas@$server_name.vegas-solution.com "sshpass -p tlsfhl!gmlakd scp -P6722 /home/vegas/$db_name.sql root@int.trustnhope.com:/root/"

elif [[  ${server_name:0:2} == "hc" ]]; then
  sshpass -f passwd.txt ssh hanchart@$server_name.hanchartcloud.com "mysqldump -uroot -p!mgrsol123 $db_name > $db_name.sql"
  sshpass -f passwd.txt ssh hanchart@$server_name.hanchartcloud.com "scp -P6722 /home/hanchart/$db_name.sql root@int.trustnhope.com:/root/"
fi

sshpass -f passwd.txt ssh -p6722 root@int.trustnhope.com "mysql -uroot -p!mgrsol123 -e 'use $db_name;'"

echo -n "컨버팅을 진행하시겠습니까? 1:예, 2:아니요 : "
read num
if [[ num -eq 1 ]]; then
  sshpass -f passwd.txt ssh -p6722 root@int.trustnhope.com "mysql -uroot -p!mgrsol123 -e 'create database $db_name;'"
  sshpass -f passwd.txt ssh -p6722 root@int.trustnhope.com "mysql -uroot -p!mgrsol123 $db_name < $db_name.sql"
