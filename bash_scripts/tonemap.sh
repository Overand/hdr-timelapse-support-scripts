#!/bin/bash
#0 -- 480

((foo = 0))
until [ $foo -gt 33 ]; do

   outname=`printf %04d ${foo}`

   if [ ! -f out/${outname}.jpg ]
    then
     if [ -f ${foo}.hdr ]
     then
       echo Processing ${foo}.hdr...
       qtpfsgui -l ${foo}.hdr -t mantiuk -p contrast=0.900:equalization=false:saturation=1.000 -o out/${outname}.jpg
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
