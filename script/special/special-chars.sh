#!/bin/bash

# ABS, Advanced Bash Scripting Guide
# Table B-1. Special Shell Variables

shell=${SHELL:-/bin/bash}

function dump_special_chars {
	echo "File name of current script"
	echo -e "\t\$0 = \"$0\""

	echo "Number of positional parameters"
	echo -e "\t\$# = $#, \${#*} = ${#*}, \${#@} = ${#@}"

	echo "All the positiional parameters"
	echo -e "\t\$* = \"$*\", \$@ = \"$@\""

	echo "Current shell PID"
	echo -e "\t\$\$ = $$"

	echo "Flags passed to script"
	echo -e "\t\$- = $-"

	echo "Last argument of previous command"
	echo "Windows" "iOS/MacOS" > /dev/null
	echo -e "\t\$_ = $_"

	"${shell}" -c "echo \"In background process, PID: \$\$\"" &
	sleep 1 && echo "Process ID (PID) of last job run in background"
	echo -e "\t\$! = $!"

	echo "Return value of last command"
	"${shell}" -c "exit 7"
	echo -e "\t\$? = $?"
}

dump_special_chars "$@"

