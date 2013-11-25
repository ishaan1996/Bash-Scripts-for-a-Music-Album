#!/bin/bash
index=1
counter=20 #count maintains the count of 20 songs
while [ $counter -ne 0 ] #count>0
do
	read line < song$counter.lyric
	  #read first line of file songs
	index=1 #to skip first word - title
	var=""
	for word in $line
	do
		if [ $index -eq 1 ]
		then
		index=2
		continue;
		fi
		if [ "$var" == "" ]
		then
		var="$word" #concatenate words till end of file
		else
		var="$var $word"
		fi
	done
	mv song$counter.lyric "./$var.lyric" #renaming the file
	counter=`expr $counter - 1` #decrease count by 1
done
exit 0
