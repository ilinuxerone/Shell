#!/bin/bash

function expression {
	local default="default-value"
	local other="other-value"
	
	echo "\"var\" not defined:"
	echo -e "\t\${var-$default}  = \"${var-$default}\""
	echo -e "\t\${var:-$default} = \"${var-$default}\""
	echo -e "\t\${var=$default}  = \"${var-$default}\""
	echo -e "\t\${var:=$default} = \"${var-$default}\""
	echo

	local var=""
	echo "local var=\"\":"
	echo -e "\t\${var-$default}  = \"${var-$default}\""
	echo -e "\t\${var:-$default} = \"${var-$default}\""
	echo -e "\t\${var=$default}  = \"${var-$default}\""
	echo -e "\t\${var:=$default} = \"${var-$default}\""
	echo

	var="variable"
	echo "var=\"variable\""
	echo -e "\t\${var-$default}  = \"${var-$default}\""
	echo -e "\t\${var:-$default} = \"${var-$default}\""
	echo -e "\t\${var=$default}  = \"${var-$default}\""
	echo -e "\t\${var:=$default} = \"${var-$default}\""
	echo

	unset -v var
	echo "\"var\" not defined:"
	echo -e "\t\${var+$other}  = \"${var+$other}\""
	echo -e "\t\${var:+$other} = \"${var+$other}\""
	echo

	local var=""
	echo "local var=\"\":"
	echo -e "\t\${var+$other}  = \"${var+$other}\""
	echo -e "\t\${var:+$other} = \"${var+$other}\""
	echo

	var="variable"
	echo "var=\"variable\""
	echo -e "\t\${var+$other}  = \"${var+$other}\""
	echo -e "\t\${var:+$other} = \"${var+$other}\""
	echo
}


function abort {
	local errmsg="Bash shell script aborted."
	local var="echo \"GNU Bash Shell is Good.\""
	${var?$errmsg}
	echo "Try to unset \"var\""
	unset -v var
	${var?$errmsg}
}

function varprefix {
	local varia0="Hello "
	local varia1="Bash "
	local varia2="Shell."

	echo "\${!varia*} = ${!varia*}"
	echo "\${!varia@} = ${!varia@}"
	echo
}

expression
varprefix
abort

