#!/bin/bash

#Wrapper Script!

mapper=$1
threads=$2

if [ ! ${mapper} ]
 then
   echo Usage: $0 tonemapperscript threads
   echo Example:  $0 ./tonemap-fattal-eq.sh 4
   echo
 else
  if [ ${threads} ]
   then
     counter=0
     while [ ${counter} -lt ${threads} ]; do
       $1 ${counter} ${threads} &
       ((counter=counter+1))
     done
   else
       echo $1
  fi


fi

