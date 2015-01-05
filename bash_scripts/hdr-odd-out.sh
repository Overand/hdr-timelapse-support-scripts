#!/bin/bash

((foo = 3))

until [ $foo -gt 2084 ]; do

if [ ! -f $(($foo/3)).hdr ] 
  then

  a=`printf %05d $foo`
  b=`printf %05d $((foo+1))`
  c=`printf %05d $((foo+2))`

  outnum=`printf %05d $((foo/3))`
#  d=`printf %04d $((foo+3))`
#  e=`printf %04d $((foo+4))`



#  align_image_stack -o $(($foo/3)).hdr ${a}.jpg ${b}.jpg ${c}.jpg
#  pfsin ${a}.jpg ${b}.jpg ${c}.jpg | tee >(pfsout ${outnum}.hdr) | pfssize -x 1280 -y 850 | pfscut --top 75 --height 720 | pfstmo_mantiuk06 --saturation 1 --equalize-contrast 0.2 | pfsgamma -g 2.3 | pfsout ${outnum}.tif
  pfsin ${a}.jpg ${b}.jpg ${c}.jpg | pfssize -x 1280 -y 850 | pfscut --top 75 --height 720 | pfstmo_mantiuk06 --saturation 1 --equalize-contrast 0.2 | pfsgamma -g 2.3 | pfsout ${outnum}.tif
 else
   echo $(($foo/3)).hdr exists!
 fi

  foo=$((foo+6))

done

