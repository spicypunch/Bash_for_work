#!/bin/bash

cd /db/mysql/
# 오늘 날짜로부터 2일 전 미만의 mysql-bin.으로 시작하는 파일은 /backup/binlogfile/ 디렉토리로 옮겨준다
find ./ -mtime +2 -name "mysql-bin.*" -exec mv {} /backup/binlogfile/ \;