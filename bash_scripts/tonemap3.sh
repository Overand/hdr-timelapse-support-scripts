#!/bin/bash
#0 -- 480

((foo = 0))
until [ $foo -gt 1042 ]; do

   outname=`printf %04d ${foo}`

   if [ ! -f out3/${outname}.png ]
    then
     if [ -f ${foo}.hdr ]
     then
       echo Processing ${foo}.hdr...
       qtpfsgui -l ${foo}.hdr -r 960 -t fattal -p alpha=0.100:beta=0.800:color=1.000:noise=0.000:new=false -o out3/${outname}.png
     else
       echo ${foo}.hdr not found!
     fi
   fi

   foo=$((foo+1))

done

