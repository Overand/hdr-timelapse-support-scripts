#!/bin/bash

#Wrapper Script!
#
# This "forks out" multiple instances of the tonemapping scripts, with the idea
# being to run as many as you have CPU cores, assuming the "tonemap-fattal-eq.sh"
# script referenced in this case doesn't do multithreading itself.  Usage is as
# specified.
#

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

