#!/bin/sh

#play with kjv.txt

#kjv.txt file defination
kjv="/Users/Lei/Documents/Scripts/Shell/kjv.txt"

while IFS=: read name uid gid word
do
	echo "$name\t says: \t$word"
	if [ "$name" == "$1" ]
	then
		echo "Found it!"
		exit 0
	fi
done <$kjv