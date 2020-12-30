#!/bin/bash
if [ "$1" == "" ]
then
  echo "Usage: $0 <name>"
  exit 1
fi

SERVICE_NAME=$1
PID_DIR=/var/run/$SERVICE_NAME
PID_FILE=$SERVICE_NAME.pid
IDENTIFIER=$SERVICE_NAME.jar

function kill_process() {
  echo "$SERVICE_NAME destroy started..."

  PID=`cat $PID_DIR/$PID_FILE 2>/dev/null`
  if [ ! -z $PID ]; then
    echo "shutting down $SERVICE_NAME. pid=$PID."
    # kill -9 $PID
  else
    echo "Not running (pidfile not found)"
  fi

  process_count=`ps aux | grep $IDENTIFIER | grep -v grep | wc -l`
  if [ ! $process_count -eq 0 ]; then
    echo "shuttind down $SERVICE_NAME. identifier=$IDENTIFIER."
    ps aux | grep $IDENTIFIER | grep -v grep | awk '{print $2}' | xargs kill -9
  fi

  process_count=`ps aux | grep $IDENTIFIER | grep -v grep | wc -l`
  if [ $process_count -eq 0 ]; then
    echo "$SERVICE_NAME destroy completed."
  else
    echo "$SERVICE_NAME destroy failed."
  fi
}

function clear_pid() {
  if [ -f  $PID_DIR/$PID_FILE ]; then
    echo "rm $PID_DIR/$PID_FILE."
    rm $PID_DIR/$PID_FILE
  fi
}

kill_process
clear_pid