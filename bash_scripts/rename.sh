#!/bin/bash
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
