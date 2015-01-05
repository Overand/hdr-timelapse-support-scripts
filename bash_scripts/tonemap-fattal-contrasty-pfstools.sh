#!/bin/bash
#0 -- 480

# use "." if need be
indir=in

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
until [ $foo -gt 1483 ]; do

   outname=`printf %04d ${foo}`

   if [ ! -f ${outdir}/${outname}.jpg  ]
    then
     if [ -f ${indir}/${foo}.hdr ]
     then
       echo Processing ${foo}.hdr...
     pfsin ${indir}/${foo}.hdr | pfstmo_fattal02 -a 0.0260 -b 0.620 -s 1.0 -n 0.070 | pfsout ${outdir}/${outname}.png
     else
       echo ${foo}.hdr not found!
     fi
   fi

   foo=$((foo+county))

done
