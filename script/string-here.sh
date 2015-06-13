#!/bin/bash

String="This is a string of words"

read -r -a Words <<< "$String"

i=0
echo "The words are \"${Words[*]}\""
until [ -z "${Words[$i]}" ] ; do
	echo -e "[$i]:\t${Words[$i]}"
	let "i++"
done

exit 0

