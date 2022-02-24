#!/bin/bash
## crontab -e

upower -i /org/freedesktop/UPower/devices/DisplayDevice > /root/battery.txt
percent=`awk '/%/ {print $2}' /root/battery.txt`
num=`echo "${percent:0:2}"`
if [ "$num" -le 20 ] ;then
	echo "battery: $percent"
fi
