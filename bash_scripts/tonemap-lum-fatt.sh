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
until [ $foo -gt 200 ]; do

   outname=`printf %04d ${foo}`

   if [ ! -f ${outdir}/${outname}.jpg  ]
    then
     if [ -f ${indir}/${foo}.hdr ]
     then
       echo Processing ${foo}.hdr...
#     pfsin ${indir}/${foo}.hdr | pfstmo_fattal02 -a 1.000 -b 0.900 -s 0.8 -n 0.010 | pfsout ${outdir}/${outname}.png
      luminance -t fattal -p alpha=0.800:beta=0.290:color=1.000:noise=0:new=false -l ${indir}/${foo}.hdr -o ${outdir}/${outname}.png
     else
       echo ${foo}.hdr not found!
     fi
   fi

   foo=$((foo+county))

done
