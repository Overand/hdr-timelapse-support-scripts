#!/bin/bash
#
#  Ths script is used to help ImageMagickcombine/blend two different versions
# of each frame of a video together, such in a set of time-lapse images.   e.g.
# blending a non-tonemapped image with an HDR tonemapped image, for each frame
#of a time lapse, for artistic purposes (such as making the HDR effect less
# pronounced)
#
# In the code below, unmodified, this script combines images as shown:
#
# Input 1: un-proc/0000.jpg (80%)
# Input 2: 0000.jpg (20%)
# Output:  proc-small/0000.jpg
#
# It runs from file "0000.jpg" to "0069.jpg" - easily modified.  (Obviously this
# could be done with variables with better names, but this comment is more fun to
# write than the script would be to fix!


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
