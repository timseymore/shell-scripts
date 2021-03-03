#!/bin/bash

# Removes all temp files left from vim and emacs

FILES=$(ls ~ | wc -l)


function set-count() {
    if [ "$FILES" -gt "0" ]
    then
	return 0
    else
	FILES=0
	return 1
    fi
}

function remove-file() {
    local F=$1
    if [ -f "$F" ]
    then
	rm "$F" && echo "Removed file $F"
	return 0
    elif [ "$F" = "*~" ]
    then
	return 1
    else
	echo "File $F does not exist." 
	return 2
    fi
}


# Run

set-count

for FILE in *"~"
do
    remove-file "$FILE"
done

echo "Removed $FILES files."

exit 0
