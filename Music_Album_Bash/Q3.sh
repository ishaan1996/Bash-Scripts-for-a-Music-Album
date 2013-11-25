#!/bin/bash
ls *.lyric | cat > tmp
xpl="`cat expletives.list`"
while read line
do
	GLOBIGNORE="*"
	for abuse in $xpl
	do
		replace="*****"
		sed -i "s/$abuse/$replace/g" "$line"
	done
	abuse=""
done < tmp
exit 0
