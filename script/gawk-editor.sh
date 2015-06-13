#!/system/bin/bash

NumFunc=0
declare -a Funcs
function simple_gawk {
	if [ -n "$1" ] && [ $1 -eq 0 ] ; then
		echo "Simple gawk script"
		return
	fi
	local cmd="echo -e \"Don't Say Hello!\\nShut up!\" | gawk '{print \"Hello John!\"}'"
	echo -en '\033[0;33m'
	echo -n "$cmd"
	echo -e '\033[1;36m'
	eval $cmd
}
Funcs[$NumFunc]=simple_gawk
let "NumFunc++"

function data_field {
	if [ -n "$1" ] && [ $1 -eq 0 ] ; then
		echo "Data field variable in gawk"
		return
	fi
	local cmd="echo -e \"zero\\none two\\nthree four five\\nsix seven eight nine\" | gawk '{print \$1}'"
	echo -en '\033[0;33m'
	echo -n "$cmd"
	echo -e '\033[1;36m'
	eval $cmd
}
Funcs[$NumFunc]=data_field
let "NumFunc++"

function multi_cmd {
	if [ -n "$1" ] && [ $1 -eq 0 ] ; then
		echo "Multi-command with gawk"
		return
	fi
	local cmd="echo \"My name is Rich\" | gawk '{\$4 = \"Christine\"; print \$0}'"
	echo -en '\033[0;33m'
	echo -n "$cmd"
	echo -e '\033[1;36m'
	eval $cmd
}
Funcs[$NumFunc]=multi_cmd
let "NumFunc++"

function pre_post_script {
	if [ -n "$1" ] && [ $1 -eq 0 ] ; then
		echo "Pre- & Post command in gawk"
		return
	fi
	
	local cmd="echo \"Hello gawk!\" | gawk 'BEGIN {print \"^_^\"} {print \$0} END {print \"~_~\"}'"
	echo -en '\033[0;33m'
	echo -n "$cmd"
	echo -e '\033[1;36m'
	eval $cmd
}
Funcs[$NumFunc]=pre_post_script
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
			echo -en '\033[0m' # just add new line and then reset color
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

