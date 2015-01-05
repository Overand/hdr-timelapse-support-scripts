#!/bin/bash
# Set Range please!


# use "." if need be
indir=.
outdir=out-m2
max=214


if [ ! -f ${outdir} ]
  then
    mkdir ${outdir}
fi


if [ ! $1 ]
 then
  ((offset=0))
  ((county=1))
  echo Assuming default threading parameters...
 else
    ((offset=$1))
  if [ ! $2 ]
    then
      ((county=1))
    else
      ((county=$2))
  fi
fi
  


((foo = 0+offset))
until [ $foo -gt $max ]; do

   outname=`printf %04d ${foo}`

   if [ ! -f ${outdir}/${outname}.tif  ]
    then
     if [ -f ${indir}/${foo}.hdr ]
     then
       echo Processing ${foo}.hdr...
     pfsin ${indir}/${foo}.hdr | pfssize -x 1280 -y 850 | pfscut --top 75 --height 720 | pfstmo_mantiuk06 --saturation 1 -f 0.1 |pfsgamma -g 2.2 | pfsout ${outdir}/${outname}.tif
     else
       echo ${foo}.hdr not found!
     fi
   fi

   foo=$((foo+county))

done
