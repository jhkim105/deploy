#!/bin/bash
if [ "$1" == "" ]
then
  echo "Usage: $0 <name>"
  exit 1
fi

service_name=$1

echo ">> $service_name kill start"

echo "> $service_name PID �~@�~C~I"
pid=$(pgrep -f $service_name)
echo "> PID = $pid"


if [ -z $pid ]; then
        echo "> $service_name process is not running "
else
        echo "> kill -9 $pid"
        kill -9 $pid
        sleep 5
fi

echo ">> $service_name kill finish"