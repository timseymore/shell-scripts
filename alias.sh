#!/bin/bash

##############################
# Manages Git alias settings #
##############################


# Global Variables

SCRIPT="$0"
FLAG="$1"



# Functions

function show-help() {
    echo "       Usage Flags"
    echo "==========================="
    echo "-l : List all current alias"
    echo "-s : Set up common Git alias"
    echo "-h : Show help screen"
    return 0
}


function list-alias() {
    echo "Git Alias Settings"
    echo "=================="
    git config --list | grep alias
    echo "=================="
    echo "    Complete"
    return 0
}

function set-alias() {
        

    return 0
}

function make-exit-status() {
    if [ $? == 0 ]
    then
	echo "Success."
    else
	echo "Failure: exit status ${?}."
    fi
    return $?
}


# Run

case "$FLAG" in
    -h)
	show-help
	;;
    -l)
	list-alias
	;;
    -s)
	echo "Setting up Git alias..."
	git config --global alias.settings "config --list"
	git config --global alias.set "config --global"
	git config --global alias.unset "config --global --unset"
	git config --global alias.last "log -1 HEAD"
	git config --global alias.unstage "reset HEAD--"
	git config --global alias.lg "log --pretty=format:'%C(cyan dim)%h%C(green bold no-dim)%d%n%C(red dim)%D %C(white): %C(cyan)%an %C(yellow)<%ae>%n%C(white no-dim no-bold)%B' --graph --all"
	git config --global alias.lgo "log --pretty=format:'%C(cyan dim)%h%C(green bold no-dim)%d %C(cyan bold): %C(red dim)%cr %C(cyan no-dim bold)-> %C(white no-bold)%s' --graph --all"
	git config --global alias.ci commit
	git config --global alias.ca "commit -a"
	git config --global alias.cm "commit -m"
	git config --global alias.cam "commit -a -m"
	git config --global alias.st status
	git config --global alias.br branch
	git config --global alias.bv "branch -vv"
	git config --global alias.mkbr "checkout -b"
	git config --global alias.rmbr "branch -d"
	git config --global alias.rmbr-h "branch -D"
	git config --global alias.co checkout
	git config --global alias.track "checkout --track"
	git config --global alias.rs "remote show"
	git config --global alias.rv "remote -v"
	git config --global alias.mkrm "remote add"
	git config --global alias.delrm "remote rm"
	git config --global alias.mvrm "remote rename"
	git config --global alias.ta "tag -a"
	git config --global alias.count "count-objects -Hv"
	echo "Finished setting alias."
	list-alias
	;;
    *)
	echo "Usage: $SCRIPT [ -l | -s | -h ]"
	echo "Use -h flag for more help."
	;;
esac

make-exit-status
exit $?
