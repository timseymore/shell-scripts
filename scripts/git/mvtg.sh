#!/bin/bash

# Updates a Git tag

SCRIPT=$0
TAG=$1
COMMIT=$2
MESSAGE=$3
USAGEMSG="Usage: $SCRIPT <tag> <commit> |Optional <message>|"

if [ "$TAG" != "" ]
then
    if [ "$COMMIT" != "" ]
    then	
	if [ "$MESSAGE" != "" ]
	then
	    echo "Moving $TAG to $COMMIT with message:"
	    echo "$MESSAGE"
	    git tag -a $TAG -f $COMMIT -m "$MESSAGE" && echo "Success" || echo "Failed to move $TAG" && exit 3
	else
	    echo "Moving $TAG to $COMMIT without message."
	    echo "Opening editor..."
	    git tag -a $TAG -f $COMMIT && echo "Success" || echo "Failed to move $TAG" && exit 3
	fi
	exit 0
    else
	echo "Missing commit."
	echo "$USAGEMSG"
	exit 2
    fi    
else
    echo "$USAGEMSG"
    exit 1
fi
