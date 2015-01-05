#!/bin/bash

((foo = 0))

until [ $foo -gt 1963 ]; do

if [ ! -f $(($foo/3)).hdr ] 
  then

  a=`printf %04d $foo`
  b=`printf %04d $((foo+1))`
  c=`printf %04d $((foo+2))`
#  d=`printf %04d $((foo+3))`
#  e=`printf %04d $((foo+4))`



 align_image_stack -o $(($foo/3)).hdr mid/${a}.jpg low/${b}.jpg hi/${c}.jpg
 else
   echo $(($foo/3)).hdr exists!
 fi

  foo=$((foo+3))

done

