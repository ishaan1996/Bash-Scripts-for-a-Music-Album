#!/bin/bash
ls -b *.encrypted | cat > temp
while read line   # line has the name of the file
do
	crew="`sed -n '2,2p' "$line" | cut --complement --bytes=1-8`"","
	crew="$crew""`sed -n '3,3p' "$line" | cut --complement --bytes=1-10`"
	count=$((`echo "$crew" | grep -o ',' | wc -l` + 1))
	sum=$(($sum + $count))
done < temp
sum=$(($sum + 1))
total=`sed  -n '2,2p' "stats.memo" | cut -d'$' -f2` # to print $ before amt.
total=`echo "$total*0.5/$sum" | bc -l`
echo \$"`printf "%.2lf\n" $(echo $total)`" > payday.dreday
exit 0

