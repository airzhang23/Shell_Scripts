#!/bin/sh

filec=0
filesize=222k

#create large number of file
#You need to specify how much file you want to create
while [[ $filec -lt $1 ]]; do
	filec=`expr $filec + 1`
	#Unix and Mac
	#mkfile -v $filesize SM$filec
	#Linux
	fallocate -l $filesize SM$filec
done