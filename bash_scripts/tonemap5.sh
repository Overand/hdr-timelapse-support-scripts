#!/bin/bash
#0 -- 480

((foo = 0))
until [ $foo -gt 1483 ]; do

   outname=`printf %04d ${foo}`

   if [ ! -f out5/${outname}.jpg  ]
    then
     if [ -f ${foo}.hdr ]
     then
       echo Processing ${foo}.hdr...
       pfsin ${foo}.hdr | pfstmo_mantiuk06 -e 1.0 -s 1.0 | pfsout out5/${outname}.jpg
     else
       echo ${foo}.hdr not found!
     fi
   fi

   foo=$((foo+1))

done
