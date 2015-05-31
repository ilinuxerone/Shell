#!/bin/bash

##################################################
#Description:capture user, cpu, mem, disk stats statics
#
##################################################


###############
#
#count user logined in
#
USERS=`who|wc -l`

###############
#
#cpu load average
#
LOAD=`uptime|cut -d, -f3|cut -d: -f2`
LOAD=`uptime|awk -F, '{print $3}'|awk '{print $3}'`
#

################
#
#Free Mem Staticstic
################
MEM=`free -m|head -n 2|tail -n 1|awk '{print $4}'`
#

##################
#
#Swap Mem Saticstic
##
SWAP=`free -m|tail -n 1|awk '{print $4}'`

#################
#Disk Available
#
#
DISK=`df -h|awk 'BEGIN{sum=0} {sum = sum + $4} END{print sum}'`
#

echo $USERS  $LOAD $MEM $SWAP $DISK





