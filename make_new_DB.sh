#!/bin/bash

#가용중인 DB 서버 IP 배열
arr=(222.122.@@.XX 222.122.@@.XX 222.122.@@.XX 222.122.@@.XX 222.122.@@.XX 222.122.@@.XX)

#create database db_name
echo -n "생성할 DB 명을 입력하시오 : "
read db_name

#IP 배열 순서대로 번호를 매겨서 관리하기 때문에 번호를 입력받음
echo -n "DB를 만들 서버의 번호를 입력하시오 [ex)hc4 -> 4] : "
read server_name

server_name=${arr[$server_name-1]}
echo "$server_name"

#공DB를 저장하고 있는 서버에 접속하여 DB를 Dump함
ssh -pnumber ID@Domain "mysqldump -uroot -ppasswd db > db.sql"

#새로 DB를 생성할 서버에 db.sql을 옮김
ssh ID2@$server_name "scp -Pnumber ID@Domain:/home/t00000.sql /home/ID2/"

#입력받은 값을 이름으로 DB 생성
ssh ID2@$server_name "mysql -uroot -ppasswd -e 'create database $db_name'"

#옮겨놓은 공DB Restore
ssh ID2@$server_name "mysql -uroot -ppasswd $db_name < db.sql"
