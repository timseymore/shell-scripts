#!/bin/bash

# Manages the colors in Git command line

SCRIPT=$0
OPT1=$1
OPT2=$2

EXITCODE=0

space() {
    echo " "
    return 0
}

show-usage() {
    echo "Usage: $SCRIPT <option> <option> ..."
    return 0
}

show-commands() {
    echo " _________________________"
    echo "|         Commands        |"
    echo "|_________________________|"
    echo "| help  | show help menu  |"
    echo "|       |                 |"
    echo "|_______|_________________|"
    return 0
}

show-help() {
    show-usage
    space
    show-commands
    space
    return 0
}

#TODO
handle-args() {
    echo "TODO"
    return 2
}

# RUN

case $OPT1 in
    "")
	show-usage
	#$EXITCODE=1
	;;
    help)
	show-help
	#$EXITCODE=$?
	;;
    *)
	handle-args
	#$EXITCODE=$?
	;;
esac

exit 0
