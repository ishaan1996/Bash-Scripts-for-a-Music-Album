#!/bin/bash

ls *.lyric | cat | cut -d"." -f1| sort  > tmp
index=1
echo -n "" > Tracklist.list
while read line 
do
if [ "$index" -lt 10 ]
then
string="0$index. $line"
else
string="$index. $line"
fi
echo "$string" >>Tracklist.list
index=`expr $index + 1`
done < tmp
exit 0
