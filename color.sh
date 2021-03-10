#!/bin/bash

# Manages the colors in Git command line

SCRIPT=$0
OPT1=$1
OPT2=$2
OPT3=$3

function show-usage() {
    echo "Usage: $SCRIPT <option> <option> ..."
    return 0
}

function show-commands() {
    echo " ___________________________________________________"
    echo "|                       Commands                    |"
    echo "|___________________________________________________|"
    echo "| help <command>  | show help menu <help with cmd>  |"
    echo "| set             | set to basic color scheme       |"
    echo "| set <opt> <col> | set <opt> to color <col>        |"
    echo "| list            | list current color settings     |"
    echo "|_________________|_________________________________|"
    return 0
}

function show-help() {
    show-usage
    echo " "
    show-commands
    echo" "
    if ["$1" -ne ""]
    then
	echo "Showing help for ${1}:"
	echo "TODO"
    fi
    return 0
}

function set-color() {
    local TARGET=$1
    local COLOR=$2
    echo "Setting color for $TARGET to $COLOR"
    git --config --global color.$TARGET $COLOR && echo "Success" || echo "Failed" && return 1
    return 0
}


# RUN

case "$OPT1" in
    "")
	show-usage
	;;
    "help")
	show-help $OPT2
	;;
    "set")
	if [ "$OPT2" -ne "" ]
	then
	    set-color $OPT2 $OPT3
	else
	    echo "Setting to basic color scheme..."
	    echo "TODO"
	    exit 1
	fi	
	;;
    "list")
	echo "Current Git Color Settings"
	echo "=========================="
	git config --list | grep color
	echo "=========================="
	;;
    *)
	echo "$OPT1 $OPT2"
	exit 2
	;;
esac

exit 0
