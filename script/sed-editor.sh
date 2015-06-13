#!/system/bin/bash

. ./hcommon.sh

function simple_replace {
	if [ -n "$1" ] && [ $1 -eq 0 ] ; then
		echo "Simple text replacement with \"sed\""
		return
	fi
	
	local cmd='echo -en "No more! Never more!\nNothing more!\n" | sed "s/more/More/"';
	eval_string "$cmd" 0

	cmd='echo -en "No more! Never more!\nNothing more!\n" | sed "s/more/More/g"';
	eval_string "$cmd"
}
add_func simple_replace

function multi_cmd {
	if [ -n "$1" ] && [ $1 -eq 0 ] ; then
		echo "Multi-edit command with \"sed\""
		return
	fi

	local cmd='echo "Eest or Wast, Home is the Best!" | sed -e "s/est/ast/; s/ast/est/"';
	eval_string "$cmd" 0

	cmd='echo "Eest or Wast, Home is the Best!" | sed -e "s/ast/est/; s/est/ast/"';
	eval_string "$cmd"
}
add_func multi_cmd

function sed_replacement_flags {
	if [ -n "$1" ] && [ $1 -eq 0 ] ; then
		echo "Replacement flags in sed"
		return
	fi

	local cmd='echo -e "love me love my dog\nlove love love" | sed "s/love/like/2"'
	eval_string "$cmd" 0

	cmd='echo -e "love me love my dog\nlove love love" | sed "s/love/like/g"'
	eval_string "$cmd" 0

	cmd='echo -e "love me love my dog\nlove love love" | sed -n "s/dog/cat/p"'
	eval_string "$cmd"
}
add_func sed_replacement_flags

function sed_addressing {
	if [ -n "$1" ] && [ $1 -eq 0 ] ; then
		echo "Line addressing in Sed"
		return
	fi
	
	local cmd='echo -e "small cat\nsmall dog\nsmall boy" | sed "2s/small/little/"'
	eval_string "$cmd" 0

	cmd='echo -e "small cat\nsmall dog\nsmall boy\njhon small" | sed "2,3s/small/little/"'
	eval_string "$cmd" 0

	cmd='echo -e "small cat\nsmall dog\nsmall boy\njhon small" | sed "2,\$s/small/little/"'
	eval_string "$cmd" 
}
add_func sed_addressing

function delete_line {
	if [ -n "$1" ] && [ $1 -eq 0 ] ; then
		echo "Delete command in Sed"
		return
	fi

	local cmd='echo -e "Line 0\nLine 1\nLine 2\nLine 3\nLine 4" | sed "2d"'
	eval_string "$cmd" 0
	
	cmd='echo -e "Line 0\nLine 1\nLine 2\nLine 3\nLine 4" | sed "3,\$d"'
	eval_string "$cmd" 0

	cmd='echo -e "Line 0\nLine 1\nLine 2\nLine 3\nLine 4" | sed "/ine 2/d"'
	eval_string "$cmd" 0

	cmd='echo -e "Line 0\nLine 1\nLine 2\nLine 3\nLine 4" | sed "/ine 1/,/ine 3/d"'
	eval_string "$cmd"
}
add_func delete_line

function insert_append {
	if [ -n "$1" ] && [ $1 -eq 0 ] ; then
		echo "Insert & append in Sed"
		return
	fi

	local cmd='echo -e "Line Number 2\nLine Number 4" | sed "i\\Line Number 1"'
	eval_string "$cmd" 0

	cmd='echo -e "Line Number 1\nLine Number 2\nLine Number 3" | sed "a\\Line Number x"'
	eval_string "$cmd" 0

	cmd='echo -e "Line Number 1\nLine Number 2\nLine Number 3\nLine Number 4" | sed "3i\\Line Number 2.5"'
	eval_string "$cmd"
}
add_func insert_append

function line_change {
	if [ -n "$1" ] && [ $1 -eq 0 ] ; then
		echo "Change line with Sed"
		return
	fi

	local cmd='echo -e "Line 0\nLine 1\nLine 2\nLine 3" | sed "3c\\The Replaced Line"'
	eval_string "$cmd" 0

	cmd='echo -e "Line 0\nLine 1\nLine 2\nLine 3" | sed "2,3c\\The Replaced Line"'
	eval_string "$cmd" 0

	cmd='echo -e "Line 0\nLine 1\nLine 2\nLine 3" | sed "/ine 1/c\\The Replaced Line"'
	eval_string "$cmd"
}
add_func line_change

function character_transform {
	if [ -n "$1" ] && [ $1 -eq 0 ] ; then
		echo "Character transform with Sed"
		return
	fi

	local cmd='echo -e "ABCDabcd\nabcdABCD" | sed "y/ABCDabcd/abcdABCD/"'
	eval_string "$cmd"
}
add_func character_transform

. ./bcommon.sh

