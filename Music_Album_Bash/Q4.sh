#!/bin/bash
ls -b *.lyric | cat > temp
while read line
do
	counter=`wc -l "$line" | cut -d" " -f1`  #line is name of the file
	counter=`expr $counter - 4`
	newline=`echo "$line" | cut -d"." -f1`
	sed -n '1,4p' "$line" > "$newline.encrypted"
	tail -$counter "$line" | md5sum | cut -d" " -f1 >> "$newline.encrypted"
done < temp
exit 0

