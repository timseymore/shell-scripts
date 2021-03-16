#!/bin/bash

# Manages Git alias settings

SCRIPT="$0"
FLAG="$1"
USAGEMSG="Usage: $SCRIPT < -l | -s | -h >"

function show-help() {
    echo"$USAGEMSG"
    echo ""
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
    local NAME=$1
    local VALUE=$2

    echo "Setting 'git ${1}' to 'git ${2}'."
    git config -- global "alias.${VALUE}" "$NAME" && echo "Success" || echo "Failed: $1 not set." 
    return 0
}

function make-exit-status() {
    local STATUS=$?
    if [ $STATUS == 0 ]
    then
	echo "Success."
    else
	echo "Failure: exit status ${STATUS}."
    fi
    return $STATUS
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
	set-alias settings "config --list"
	set-alias set "config --global"
	set-alias unset "config --global --unset"
	set-alias last "log -1 HEAD"
	set-alias unstage "reset HEAD--"
	set-alias lg "log --pretty=format:'%C(cyan dim)%h%C(green bold no-dim)%d%n%C(red dim)%cr %C(white): %C(cyan)%an %C(yellow)<%ae>%n%C(white no-dim no-bold)%B' --graph --all"
	set-alias lgo "log --pretty=format:'%C(cyan dim)%h%C(green bold no-dim)%d %C(cyan bold): %C(red dim)%cr %C(cyan no-dim bold)-> %C(white no-bold)%s' --graph --all"
	set-alias ci commit
	set-alias ca "commit -a"
	set-alias cm "commit -m"
	set-alias cam "commit -a -m"
	set-alias st status
	set-alias br branch
	set-alias bv "branch -vv"
	set-alias mkbr "checkout -b"
	set-alias rmbr "branch -d"
	set-alias rmbr-h "branch -D"
	set-alias co checkout
	set-alias track "checkout --track"
	set-alias rs "remote show"
	set-alias rv "remote -v"
	set-alias mkrm "remote add"
	set-alias delrm "remote rm"
	set-alias mvrm "remote rename"
	set-alias ta "tag -a"
	set-aias count "count-objects -Hv"
	echo "Finished setting all basic git alias."
	list-alias
	;;
    *)
	echo "$USAGEMSG"
	echo "Use -h flag for more help."
	;;
esac

make-exit-status
exit $?
