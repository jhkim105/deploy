#!/bin/bash

if [ "$1" == "" ] || [ "$2" == "" ]
then
  echo "Usage: $0 <ARTIFACT> <OUTPUT_DIRECTORY>"
  echo "$0 com.rsupport.remotemeeting:web:2.16.1-SNAPSHOT:war temp"
  exit 1
fi

ARTIFACT=$1
OUTPUT_DIRECTORY=$2

function download_file() {
  DEST=$HOME_DIR/$SERVICE_NAME.$PACKAGE
  echo "download file...ARTIFACT:$ARTIFACT OUTPUT_DIRECTORY:$OUTPUT_DIRECTORY"
  mvn org.apache.maven.plugins:maven-dependency-plugin:3.0.0:copy -Dartifact=$ARTIFACT -DoutputDirectory=$OUTPUT_DIRECTORY -Dmdep.useBaseVersion=true
  echo "download complete..."
}

download_file