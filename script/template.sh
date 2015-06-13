#!/system/bin/bash

NumFunc=0
declare -a Funcs
function func0 {
	if [ -n "$1" ] && [ $1 -eq 0 ] ; then
		echo "Function \"func0\""
		return
	fi
	echo "Hello, Message from func0: $1"
}
Funcs[$NumFunc]=func0
let "NumFunc++"

function func1 {
	if [ -n "$1" ] && [ $1 -eq 0 ] ; then
		echo "Function \"func1\""
		return
	fi
	echo "Hello, Message from func1: $1"
}
Funcs[$NumFunc]=func1
let "NumFunc++"

function func2 {
	if [ -n "$1" ] && [ $1 -eq 0 ] ; then
		echo "Function \"func2\""
		return
	fi
	echo "Hello, Message from func2: $1"
}
Funcs[$NumFunc]=func2
let "NumFunc++"

function display_info {
	local num=0
	while [ $num -lt $NumFunc ] ; do
		echo -en "[$num]:\t\033[0;32m"
		${Funcs[$num]} 0
		echo -en "\033[0m" # reset color mode to default
		let "num++"
	done
}

function run_function {
	local num=0
	while [ $num -lt $NumFunc ] ; do
		echo -en "[$num]:\t"
		${Funcs[$num]}
		echo -e '\033[0m'
		let "num++"
	done
}

if [ $# -ge 1 ] ; then
	while [ -n "$1" ] ; do
		if [ $1 -lt $NumFunc ] ; then
			${Funcs[$1]}
			echo -e '\033[0m' # just add new line and then reset color
		fi
		shift
	done
	exit 0
fi

echo "**********************************"
display_info
echo "**********************************"

opt=0
read -p "Please enter your option: " opt
let "opt += 0" # if $opt is not a number, this will set it to zero
if [ $opt -lt $NumFunc ] ; then
	${Funcs[$opt]}
	echo -en '\033[0m'
else
	echo -e "\nSorry, \"$opt\" is out of range."
	run_function
fi

