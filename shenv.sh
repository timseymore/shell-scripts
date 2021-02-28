#!/bin/bash

# manages the shell scripts in the current directory

SCRIPT="$0"
CMD="$1"
FLAG="$2"


case "$CMD" in
    start)
	echo "Setting up shell environment..."
	cd ./temp
	if [ $? -eq "0" ]
	then
	    for FILE in *
	    do
		echo "Copying ./temp/${FILE} in to ./${FILE}."
		cp $FILE ../$FILE 
	    done	
	    echo Done.
	    exit 0
	else
	    echo "No temp folder exists. Cancelling..."
	    exit 2
	fi
	;;
    stop)
	echo "Cleaning up shell environment..."
	cd ./temp
	if [ $? -eq "0" ]
	then
	    for FILE in *
	    do
		echo "Deleting ./${FILE}."
		rm ../$FILE
	    done	
	    echo Done.
	    exit 0
	else
	    echo "No temp folder exists. Cancelling..."
	    exit 3
	fi
	;;
    *)
	echo "Usage: $0 [start|stop] [option]"
	exit 1
esac
