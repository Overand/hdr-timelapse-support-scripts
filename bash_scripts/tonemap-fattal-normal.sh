#!/bin/bash
#0 -- 480

# use "." if need be
indir=in

outdir=out-f-n


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

      qtpfsgui -l ${indir}/${foo}.hdr -t fattal -p alpha=0.100:beta=0.800:color=1.250:noise=0.000:new=false -o ${outdir}/${outname}.png
 #     pfsin ${indir}/${foo}.hdr | pfstmo_fattal02 -a 0.0260 -b 0.620 -s 1.0 -n 0.070 | pfsout ${outdir}/${outname}.png

     else
       echo ${foo}.hdr not found!
     fi
   fi

   foo=$((foo+county))

done
