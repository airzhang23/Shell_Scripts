#!/bin/sh

#This is a script to change permission of cifs volume for CIFS lab3
#
#Author: Lei Zhang
#Date: Dec 11 2014
#
#Usage: ./cifs_lab3.sh
#Then enter DSID of the volume, and MSID you want to change to, and Volume name, and
#Cluster number 1 or 2.

# Linux/UNIX box with ssh key based login enabled

# Cluster management IP addresses for both clusters.
#SetC
#cluster1="10.61.94.111"
#cluster2="10.61.94.151"

#SetH
cluster1="10.251.198.10"
cluster2="10.251.198.20"


# SSH User name
USR="ssh"

#Change the student_cifs volumes's unix permission to 700
#ssh $USR@$cluster1 "vol modify -vserver student* -volume student*_cifs -unix-permission 700"
#ssh $USR@$cluster2 "vol modify -vserver student* -volume student*_cifs -unix-permission 700"

#ssh $USR@$cluster1 "vol modify -vserver student* -volume student*_cifs_child -unix-permission 700"
#ssh $USR@$cluster2 "vol modify -vserver student* -volume student*_cifs_child -unix-permission 700"

ssh $USR@$cluster2 "cifs access "
