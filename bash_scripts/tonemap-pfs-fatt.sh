#!/bin/bash
#0 -- 480

# use "." if need be
indir=.

outdir=out-fs


if [ ! $1 ]
 then
  ((offset=0))
  ((county=1))
  echo Assuming default parameters...
 else
  ((offset=$1))
  ((county=$2))
fi
  


((foo = 0+offset))
until [ $foo -gt 30 ]; do

   outname=`printf %04d ${foo}`
   fullout=${outdir}/${outname}.tif

   if [ ! -f ${fullout}  ]
    then
     if [ -f ${indir}/${foo}.hdr ]
     then
       echo Processing ${foo}.hdr...
     pfsin ${indir}/${foo}.hdr  | pfssize -x 1280 -y 850 | pfscut --top 75 --height 720 |  pfstmo_fattal02 -a 1.000 -b 0.900 -s 0.8 -n 0.010 | pfsout ${fullout}
     else
       echo ${foo}.hdr not found!
     fi
   fi

   foo=$((foo+county))

done
