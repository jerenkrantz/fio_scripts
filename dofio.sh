#!/bin/bash

DIRNAME=`dirname $0`

PARALLEL_COUNT=8
if [ $# -ge 1 ]; then
  PARALLEL_COUNT=$1
fi

# The default is 8GB, but we want to test larger block sizes
GIGABYTES=64
let MEGABYTES=${GIGABYTES}*1024

if [ ! -d par${PARALLEL_COUNT} ]; then
  mkdir par${PARALLEL_COUNT}
fi

for i in `seq 1 $PARALLEL_COUNT`; do
  TESTDIR=disk${i}/fio
  OUTDIR=par${PARALLEL_COUNT}/disk${i}_output
  if [ ! -d $OUTDIR ]; then 
    mkdir $OUTDIR
  fi
  if [ ! -d $TESTDIR ]; then 
    mkdir $TESTDIR
  fi
  if [ ! -d disk$i ]; then
    echo "Missing disk$i ?"
  else
    $DIRNAME/fio.sh -b fio -m ${MEGABYTES} -w $TESTDIR -o $OUTDIR & <<EOF
y
y
EOF
  fi
done
