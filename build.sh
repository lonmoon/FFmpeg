#!/bin/sh

CUR_DIR=`pwd`
BUILD_SH_DIR=$(cd "$(dirname "$0")";pwd)
OUTPUT_DIR=$BUILD_SH_DIR/output

echo 'build task start...'

cd $BUILD_SH_DIR

if [ -d $OUTPUT_DIR ]; then
  rm -rf $OUTPUT_DIR
fi
mkdir $OUTPUT_DIR

echo 'configure start...'
sh configure --prefix=$OUTPUT_DIR
echo 'configure end...'

make && make install

cd $CUR_DIR

echo 'build task end...'