#!/bin/bash
#0 -- 480

((foo = 0))
until [ $foo -gt 1483 ]; do

   outname=`printf %04d ${foo}`

   if [ ! -f out2/${outname}.jpg ]
    then
     if [ -f ${foo}.hdr ]
     then
       echo Processing ${foo}.hdr...
       qtpfsgui -l ${foo}.hdr -r 800 -t fattal -p alpha=0.100:beta=0.800:color=1.250:noise=0.000:new=false -o out2/${outname}.jpg
     else
       echo ${foo}.hdr not found!
     fi
   fi

   foo=$((foo+1))

done


#for file in $( find . | grep hdr | sort )
#fileout = `sed "s/hdr/jpg${file}
#if [ !-e 
#do
#  b=`printf %04d $foo` 
#  mv ${file} ${b}.jpg
#  foo=$((foo+1))
#done
