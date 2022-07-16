#!/bin/sh

CUR_DIR=`pwd`
BUILD_SH_DIR=$(cd "$(dirname "$0")";pwd)
OUTPUT_DIR=$BUILD_SH_DIR/output

echo 'ffplay-sp build start...'

cd $BUILD_SH_DIR

if [ -d $OUTPUT_DIR ]; then
  rm -rf $OUTPUT_DIR
fi
mkdir $OUTPUT_DIR

cd $OUTPUT_DIR && cmake .. && make

cd $CUR_DIR

echo 'ffplay-sp build end...'