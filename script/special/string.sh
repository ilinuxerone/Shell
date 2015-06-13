#!/bin/bash

function strlen {
	local str="$*"
	echo "Length of string \"$str\" = ${#str}"
}

function extract {
	if [ $# -ne 2 ] && [ $# -ne 3 ] ; then
		return
	fi
	local str="$1"
	local len=${#1}
	local pos="$2"
	if [ $len -lt $pos ] ; then
		echo "String \"$str\" is $len, but \$pos is $pos"
	else
		if [ -z "$3" ] ; then
			echo "\${\"$str\":$pos} = \"${str:$pos}\""
		else
			echo "\${\"$str\":$pos:$3} = \"${str:$pos:$3}\""
		fi
	fi
}

function match {
	local str="Love Love me, Love my dog"
	local sub="Love "
	local Tail="my dog"

	echo "\${\"$str\"#\"$sub\"}  = \"${str#$sub}\""
	echo "\${\"$str\"##\"$sub\"} = \"${str##$sub}\""

	echo "\${\"$str\"%\"$sub\"}  = \"${str%$Tail}\""
	echo "\${\"$str\"%%\"$sub\"} = \"${str%%$Tail}\""
}

function replace {
	local str="Love me, love my dog"
	
	echo "\${\"$str\"/ove/ike}  = ${str/ove/ike}"
	echo "\${\"$str\"//ove/ike} = ${str//ove/ike}"

	str="like, bike, hike"
	echo "\${\"$str\"/#like/nike} = ${str/#like/nike}"
	echo "\${\"$str\"/%ike/ide} = ${str/%ike/ide}"
}

strlen fucking shit
echo

string="fucking shit"
extract "$string" 2
extract "$string" 8
extract "$string" 8 3
echo

match
echo 

replace
echo 

