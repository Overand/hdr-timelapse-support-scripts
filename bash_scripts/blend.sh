#!/bin/bash
#0 -- 480

((foo = 0))
until [ $foo -gt 69 ]; do

   outname=`printf %04d ${foo}`

   if [ ! -f ${outname}.jpg ]
     then
        #       echo Processing ${foo}...
echo        composite -blend 80  proc-small/${outname}.jpg un-proc/${outname}.jpg ${outname}.jpg
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
