#!/bin/sh

float_value=$(free -m | grep Mem | awk '{print $3/$2 * 100.0}')
value=${float_value%.*}

printf "Memory Usage: %s%%" $value

if [ $value -gt 95 ];then
  exit 2
elif [ $value -gt 80 ]; then
  exit 1
else
  exit 0
fi
