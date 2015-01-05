#!/bin/bash
((foo = 0))
for file in $( find . | grep jpg | sort )
do
    #echo  mv ${file} ${b}.jpg
    #mv ${file} ${b}.jpg

filesed=`echo ""${file}"" | sed "s/.\///"`
#echo Foo is ${foo}
#echo File is ${file}
#echo Filesed is ${filesed}
#echo 
  

   b=`printf %04d $foo`
  case $((foo%3)) in
   '0')
   loc='mid'
   ;;
   '1')
   loc='low'
    ;;
   '2')
   loc='hi'
   ;;
  esac
ln -s ../${filesed} ${loc}/${b}.jpg
#echo  ln -s ${file} ${loc}/${b}.jpg
#echo --------------
  foo=$((foo+1))
done
