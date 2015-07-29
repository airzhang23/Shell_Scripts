#!/bin/sh

function test
{
	echo "test"
	for i in "$*"
	do
		echo $i
	done
}

printf "$# parameters entered. They are: "
#test;
for i in "$*"
do
	echo $i
done
#echo ""

case $SHELL in
*/bin/bash) alias echo="echo -e"
		;;
esac


