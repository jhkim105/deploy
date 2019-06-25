#!/bin/bash

if [ "$1" == "" ]
then
  echo "Usage: $0 <VERSION>"
  exit 1
fi

SERVICE_NAME=collector
PACKAGE=war
HOME_DIR=/DATA/WEB/$SERVICE_NAME
VER=$1-SNAPSHOT

function download_file() {
  DEST=$HOME_DIR/$SERVICE_NAME.$PACKAGE
  echo "download file...VER:$VER"
  mvn org.apache.maven.plugins:maven-dependency-plugin:3.0.0:copy -Dartifact=com.rsupport.logcollector:$SERVICE_NAME:$VER:$PACKAGE -DoutputDirectory=$HOME_DIR -Dmdep.useBaseVersion=true
  echo "download complete..."
  cd $HOME_DIR
  /bin/cp $SERVICE_NAME-$VER.$PACKAGE $SERVICE_NAME.$PACKAGE
  rm -f $SERVICE_NAME-$VER.$PACKAGE
  echo "copy complete..."
}

function stop_service() {
  service $SERVICE_NAME stop
}

function start_service() {
  service $SERVICE_NAME start
}
stop_service
download_file
start_service
