#!/bin/bash
total=0
MAX=-1
min=`sed -n '1,1p' stats.csv | cut -d" " -f2`
while read line
do
	sell=`echo $line | cut -d"," -f2 | cut -d" " -f2`
	SONG=`echo $line | cut -d"," -f1`
	total=`expr $total + $sell`
	if [ "$sell" -gt "$MAX" ]
	then
		MAX=$sell
		Bsong=$SONG
	fi
	if [ "$sell" -lt "$min" ]
	then
		min=$sell
		Wsong=$SONG
	fi
done < stats.csv
echo $total > stats.memo
total=`printf "%.2lf" $(echo $total*0.99 | bc -l)`
echo \$`echo "$total" | bc -l` >> stats.memo
echo $Bsong >> stats.memo
echo $Wsong >> stats.memo
exit 0
