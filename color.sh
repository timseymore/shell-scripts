#!/bin/bash

# Manages the colors in Git command line

SCRIPT=$0
OPT1=$1
OPT2=$2
OPT3=$3
OPT4=$4

function show-usage() {
    echo "Usage: $SCRIPT <help|option1> <option2> <option3>"
    return 0
}

function show-commands() {
    echo " __________________________________________________________________"
    echo "|                            Commands                              |"
    echo "|__________________________________________________________________|"
    echo "| help <command>        | show help menu <help with cmd>           |"
    echo "| set                   | set to basic color scheme                |"
    echo "| set <tgt> <col> <sty> | set <opt> to color <col> and style <sty> |"
    echo "| list                  | list current color settings              |"
    echo "|_______________________|__________________________________________|"
    return 0
}

function show-help() {
    show-usage
    echo " "
    show-commands
    echo" "
    if ["$1" != ""]
    then
	echo "Showing help for ${1}:"
	echo "TODO"
    fi
    return 0
}

function set-color() {
    local TARGET=$1
    local COLOR=$2
    local STYLE=$3
    echo "Setting color for $TARGET to $COLOR $STYLE"
    git config --global color.$TARGET $COLOR "$STYLE " && echo "Success" || echo "Failed" && return 1
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
	if [ "$OPT2" != "" ]
	then
	    set-color $OPT2 $OPT3 $OPT4
	else
	    echo "Setting to basic color scheme..."
	    set-color ui auto
	    set-color interactive auto	    
	    set-color branch auto
	    set-color diff auto
	    set-color status auto
	    
	    set-color branch.current cyan
	    set-color branch.local yellow
	    set-color branch.remote green
	    
	    set-color diff.meta yellow
	    set-color diff.frag magenta
	    set-color diff.old red
	    set-color diff.new green
	    
	    set-color status.added green
	    set-color status.changed blue
	    set-color status.untracked magenta
	   
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
