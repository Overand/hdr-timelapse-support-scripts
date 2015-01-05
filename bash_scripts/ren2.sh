#!/bin/bash
((foo = 0))
for file in $( find . | grep jpg | sort )
do

#    b=`printf %04d $foo` 
#    echo  mv ${file} ${b}.jpg
#    mv ${file} ${b}.jpg

newname=`exiftool ${file} -'ShutterCount' | awk '{printf $4;}'`
echo mv ${file} ${newname}.JPG
mv ${file} ${newname}.JPG

#echo Foo is ${foo}
#echo File is ${file}

#case ((foo%3))

  foo=$((foo+1))
done
