#!/bin/bash

DIRNAME=`dirname $0`

PARALLEL_COUNT=8
if [ $# -ge 1 ]; then
  PARALLEL_COUNT=$1
fi

for i in `seq 1 $PARALLEL_COUNT`; do
  OUTDIR=par${PARALLEL_COUNT}/disk${i}_output
  reportbase=`hostname`_par${PARALLEL_COUNT}_disk${i}
  reportname=par${PARALLEL_COUNT}/${reportbase}
  if [ ! -d $OUTDIR ]; then 
    echo "Missing $OUTDIR ?"
  else
    $DIRNAME/fioparse.sh -r $OUTDIR/*out > ${reportname}.r.tmp <<EOF
${reportbase}
EOF
    tail -n +2 ${reportname}.r.tmp > ${reportname}.r
    rm ${reportname}.r.tmp
  fi
done
