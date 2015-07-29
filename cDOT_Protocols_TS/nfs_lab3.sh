#!/bin/bash

#This is a script to change MSID to a value which is not exist to break NFS lab3
#
#Author: Lei Zhang
#Date: Dec 10 2014
#
#Usage: ./nfs_lab3.sh
#Then enter DSID of the volume, and MSID you want to change to, and Volume name, and
#Cluster number 1 or 2.

# Linux/UNIX box with ssh key based login enabled

# Cluster management IP addresses for both clusters.
#SetC
#cluster1="10.251.198.10"
#cluster2="10.251.198.20"

#SetH
cluster1="10.251.198.10"
cluster2="10.251.198.20"
CLUSTER=""

# SSH User name
USR="ssh"

#function to handle empty input
function input_error {
	#exit 1 if there is no input at all.
	echo "No name entered." >&2
	exit 1  ## Set a failed return code
}

#Show the original MSID,DSID of the volume
ssh $USR@$cluster1 "volume show -vserver student* -volume student*_nfs -fields msid,dsid"
ssh $USR@$cluster2 "volume show -vserver student* -volume student*_nfs -fields msid,dsid"

#Get Volume DSID
printf "DSID: "
read DSID

if [ -z "$DSID" ] 
then
	input_error
fi
	

#New Volume MSID you want to change to
printf "MSID: "
read MSID

if [ -z "$MSID" ] 
then
	input_error
fi

#Volume Name you want to change, it should be studentX_nfs generally.
printf "Volume Name: "
read volName

if [ -z "$volName" ] 
then
	input_error
fi

#Cluster number the the volume belongs to
printf "Cluster 1 or 2? "
read cNum

if [ -z "$cNum" ] 
then
	input_error
fi

if [[ $cNum == "1" ]]; then
	CLUSTER=$cluster1
elif [[ $cNum == "2" ]]; then
	CLUSTER=$cluster2
else
	echo "Please input 1 or 2."
	exit 1;
fi

echo $CLUSTER

#Show the original MSID,DSID of the volume
ssh $USR@$CLUSTER "volume show -vserver student* -volume $volName -fields msid,dsid"

#Change the MSID to a new value that doesn't exist
ssh $USR@$CLUSTER "set diag;debug smdb table modifyVolume run -volToModify $DSID -fieldsToModify 2 -volMsid $MSID -volname $volName -force true"

#Make sure the MSID has been changed
ssh $USR@$CLUSTER "volume show -vserver student* -volume $volName -fields msid,dsid"

