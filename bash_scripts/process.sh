#!/bin/bash
# Similar to "blend.sh" but  performs more operations.  -modulate is
# brightness/sat/hue, plus it also doesscaling and cropping for a
# standard "HD" video size.
#

((foo = 0))
until [ $foo -gt 69 ]; do

   outname=`printf %04d ${foo}`

   if [ ! -f ${outname}.jpg ]
     then
        #       echo Processing ${foo}...
echo        composite -blend 80 proc-small/${outname}.jpg un-proc/${outname}.jpg ${outname}.jpg
            composite -blend 80 proc-small/${outname}.jpg un-proc/${outname}.jpg -|convert - -modulate 100,150,100 -scale 1280x -crop 1280x720+0+115 ${outname}.png
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
