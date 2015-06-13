#!/system/bin/bash

. ./hcommon.sh

function plain_text {
	if [ -n "$1" ] && [ $1 -eq 0 ] ; then
		echo "BRE -- Plain Text"
		return
	fi
	eval_string "echo 'This is a test' | sed -n '/test/p'" 0
	eval_string "echo 'This is a text' | sed -n '/test/p'" 0
	eval_string "echo 'This is a test' | gawk '/text/{print \$0}'" 0
	eval_string "echo 'This is a text' | gawk '/text/{print \$0}'"
}
add_func plain_text

function anchor_beginning {
	if [ -n "$1" ] && [ $1 -eq 0 ] ; then
		echo "Special Character -- ^"
		return
	fi
	eval_string "echo 'This is it, ^_^. what is that?' | sed -n '/^what/p'" 0
	eval_string "echo 'This is it, ^_^. what is that?' | sed -n '/what/p'" 0
	eval_string "echo 'This is it, ^_^. what is that?' | sed -n '/^This/p'" 0
	eval_string "echo 'This is it, ^_^. what is that?' | sed -n '/_^/p'" 0
	eval_string "echo 'This is it, ~_~. what is that?' | sed -n '/_^/p'"
}
add_func anchor_beginning

function back_slash {
	if [ -n "$1" ] && [ $1 -eq 0 ] ; then
		echo "Special Character -- \\"
		return
	fi
	eval_string 'echo "\ backslash character" | sed -n "/\\\\/p"' 0
	eval_string 'echo "I have only \$1" | sed -n "/\\$/p"' 0
	eval_string 'echo "3 / 2 = ?" | sed -n "/\//p"'
}
add_func back_slash

. ./bcommon.sh

