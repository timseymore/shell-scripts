#!/bin/bash

# Updates a Git tag

SCRIPT=$0
TAG=$1
COMMIT=$2
MESSAGE=$3

if [$TAG != "" && $COMMIT != "" && $MESSAGE != ""]
then
    
    git tag -a $TAG -f $COMMIT -m "$MESSAGE"
else
    echo "Usage: $SCRIPT [tag] [commit] [message]"
fi
