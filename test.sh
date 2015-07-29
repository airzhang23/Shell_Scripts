#!/bin/sh

function test
{
	echo "test"
	for i in "$*"
	do
		echo $i
	done
}

if [ -f $1 ]
then
	echo "$1 does exist!"
	cat $1
else
	echo "$1 does NOT exist!"
fi

