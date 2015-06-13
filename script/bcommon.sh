#!/system/bin/bash

# bottom half common shell script

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

