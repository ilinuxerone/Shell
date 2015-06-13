#!/bin/bash

NumFunc=0
declare -a Funcs

function add_func {
	if [ -z "$1" ] ; then
		echo "Function \"add_func\" invoked with invalid argument(s)."
		exit 1
	fi
	Funcs[${NumFunc}]="$1"
	let "NumFunc++"
}

function eval_string {
	if [ -z "$1" ] ; then
		return # No arguements
	fi

	echo -en '\033[0;33m'
	echo -n "$1"
	echo -e '\033[1;36m'
	eval "$1"

	if [ -n "$2" ] && [ $2 -eq 0 ] ; then
		echo -en '\033[0m'
	else
		echo -e '\033[0m'
	fi
}

function display_info {
	local num=0
	while [ $num -lt $NumFunc ] ; do
		echo -en "[$num]:\t\033[0;32m"
		${Funcs[$num]} 0
		echo -en "\033[0m"
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

