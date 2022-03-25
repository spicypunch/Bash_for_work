#!/bin/bash

echo -n "생성할 DB 명을 입력하시오 : "
read db_name

echo -n "DB를 가져올 서버의 번호를 입력하시오 [ex)vc3, hc1] : "
read server_name

#도메인이 다르기 때문에 구별하기 위한 조건문
if [[ ${server_name:0:2} == "vc" ]]; then
  sshpass -f passwd.txt ssh user@$server_name.domain.com "mysqldump -uroot -p passwd $db_name > $db_name.sql"
  sshpass -f passwd.txt ssh user@$server_name.domain.com "sshpass -p passwd scp -P6722 /home/user/$db_name.sql root@int.domain.com:/root/"

elif [[  ${server_name:0:2} == "hc" ]]; then
  sshpass -f passwd.txt ssh user@$server_name.domain2.com "mysqldump -uroot -p!mgrsol123 $db_name > $db_name.sql"
  sshpass -f passwd.txt ssh user@$server_name.domain2.com "scp -P6722 /home/user/$db_name.sql root@int.domain.com:/root/"
fi

#DB 덮어쓰기를 예방하기 위해 본인이 만들 DB가 존재하는지 확인
echo "DB 존재 여부 확인"
sshpass -f passwd.txt ssh -p6722 root@domain.com "mysql -uroot -p passwd -e 'show databases like '\''$db_name'\'';'"

echo -n "컨버팅을 진행하시겠습니까? 1:예, 2:아니요 : "
read num
if [[ num -eq 1 ]]; then
  sshpass -f passwd.txt ssh -p6722 root@int.domain.com "mysql -uroot -p passwd -e 'create database $db_name;'"
  sshpass -f passwd.txt ssh -p6722 root@int.domain.com "mysql -uroot -p passwd $db_name < $db_name.sql"
fi
