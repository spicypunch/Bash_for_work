#!/bin/bash
## crontab을 이용하여 원하는 날짜 및 시간에 DB 백업 자동화

backup_dir=/var/backup/ # DB를 저장할 경로

backup_cnt=7 # 백업 디렉토리에 유지할 디렉토리 개수

db_root_pw='passwd' # Dump할 DB 비밀번호

today="`date '+%Y%m%d'`" # 현재 날짜

DBServer="127.0.0.1" # Dump할 DB 서버 주소 

#오래된 디렉토리 삭제(디렉토리 이름 기준)
old_backup_dir="`ls -r $backup_dir|grep db 2>/dev/null`"
i=0
for dir in $old_backup_dir ; do
echo $dir
  if [ ${dir:0:2} == "db" ] ; then
    i=$((i+1))
    if [ "$i" -ge "$backup_cnt" ] ; then
      echo "rm -rf $backup_dir$dir"
      rm -rf $backup_dir$dir
    fi
  fi
done

#오래된 디렉토리 삭제(디렉토리 시간 기준)
find $backup_dir -mtime +7 -name "db.*" -exec rm -rf {} \;

#오늘 날짜의 디렉토리가 없을 시 디렉토리 생성
new_dir="`ls db.$today 2>/dev/null`"
if [[ $new_dir == "" ]]; then
  mkdir -p $backup_dir/db.$today/
fi

#db 목록 list
db_list=`echo "show databases;" | mysql -N -uvegas -p"$db_root_pw" -h $DBServer`

#조건문에 맞는 DB 만 백업
for db in $db_list ; do
  # create backup dir db
  if [[ "$db" == "t00054" ]] || [[ ${db:0:2} == "h0" ]]; then
    mysqldump -uvegas -p"$db_root_pw" -h $DBServer $db > $backup_dir/db.$today/$db.sql
  fi
done
