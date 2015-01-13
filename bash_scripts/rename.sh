#!/bin/bash
#
# This script takes a pile of files, sorts them alphabetically (or numerically),
# and then writes them out to a consistent format, for simpler processing with
# the other scripts.
#
# In this case, it looks for files in the current directory with JPG in the file-
# name, sorts them, and then renames them in the format 0000.jpg 0001.jpg etc.
#
# This is horribly implemented and could easiyl be done with something like
#      find . -name "*JPG" | sort 
# or something else even saner, but it worked then and it's "preserved" here.
#

((foo = 0))
for file in $( find . | grep JPG | sort )
do
    b=`printf %04d $foo` 
    echo  mv ${file} ${b}.jpg
    mv ${file} ${b}.jpg

#echo Foo is ${foo}
#echo File is ${file}

#case ((foo%3))

  foo=$((foo+1))
done
