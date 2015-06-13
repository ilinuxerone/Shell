#!/bin/bash

# ABS, Advanced Bash Scripting Guide.
# Here document

function here0 {
	local var="value"
	cat <<ENDHERE
Here is a simple demonstration of here-document. # Yes it is
# every thing is treated as is in here-document.
	\\Including this.
		\$var = "${var}"
`ls -l`
ENDHERE
}

function here1 {
	local var="value"
	cat <<-ENDHERE
Here is a simple demonstration of here-document. # Yes it is
# every thing is treated as is in here-document.
	\\Including this.
		\$var = "${var}"
ENDHERE
}

shell=${SHELL-/bin/bash}
function here2 {
	${shell} -s <<ENDSHELL
# here is comment
echo -en "\\tLove me, \\n\\t\\t\\tlove my dog\\n"
exit 7
ENDSHELL
	echo "\$? = $?"
}

function here3 {
	local var="value"
	cat <<-"ENDHERE"
		fucking shit
		\$var = \"$var\"
			`ls -l`
ENDHERE
}

function here4 {
	${shell} -s 
	echo "\$? = $?"
}

here0 ; echo ; here1 ; echo ; here2 ; echo ; here3
echo 

here4 <<"SHELLCMD"
# No matter what, you just want to read it again
export LINK="yeholmes@163.com"
echo -en "\t\t\nHaha, \$LINK = $LINK\n"
exit 9
SHELLCMD

# comments
: <<"COMMENTS"
this is a simple demonstration of multi-line 
comments. Very useful, is it not?
COMMENTS

