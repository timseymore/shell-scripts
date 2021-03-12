#!/bin/bash

# Updates a Git tag

SCRIPT=$0
TAG=$1
COMMIT=$2
MESSAGE=$3

if [$TAG != "" && $COMMIT != ""]
then
    if [$MESSAGE != ""]
    then
	echo "Moving $TAG to $COMMIT with message:"
	echo "$MESSAGE"
	git tag -a $TAG -f $COMMIT -m "$MESSAGE" && echo "Success" || echo "Failed to move $TAG" && exit 2
    else
	echo "Moving $TAG to $COMMIT without message."
	echo "Opening editor..."
	git tag -a $TAG -f $COMMIT && echo "Success" || echo "Failed to move $TAG" && exit 2
    fi
    exit 0
else
    echo "Usage: $SCRIPT <tag> <commit> |Optional: <message>|"
    exit 1
fi
