#!/bin/sh

percent=$(df -h / | awk '{if ($5 != "Use%") print $5}')
value=${percent%?}

printf "Disk Usage: %s%%\n" $value

if [ $value -gt 95 ];then
  exit 2
elif [ $value -gt 80 ];then
  exit 1
else
  exit 0
fi
