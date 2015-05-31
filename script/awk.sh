#!/bin/bash


IP_LIST=`ifconfig -a|grep Bcast|awk '{print $2}'|cut -d: -f2`
