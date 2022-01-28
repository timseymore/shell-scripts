#!/bin/bash

# Compiles a C source file into an executable program.

SCRIPT="$0"
NAME="$1"

case $NAME in
    "")
	echo "Usage: ${SCRIPT} [out]"
	;;
    *)
	if [ -f "${NAME}.c" ]
	then	    
	    clang -o $NAME ${NAME}.c
	else
	    echo "${NAME}.c does not exist."
	fi
	;;
esac
