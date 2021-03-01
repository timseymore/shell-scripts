#!/bin/bash

# sorts files into directories based on file extension

SCRIPT=$0
TARGET=$1
PICS="./Pictures/"
VIDS="./Videos/"
GIFS="./GIFs/"
WEBP="./WEBP/"
DOCS="./Documents/"
MISC="./Misc/"


function check-for() {
    local TYPE=$1
    local DIR=$2
    echo "Checking for ${TYPE}..."
    for FILE in *.${1}
    do
	if [ -f "$FILE" ]
	then
	    echo "Found: $FILE"
	    mv "$FILE" "${DIR}/${FILE}" &&  echo "Moved to ${DIR}/${FILE}" || echo "$FILE not moved."
	fi
    done    
}



if [ "$TARGET" == "" ]
then    
    echo "Usage: $SCRIPT [target]"
    exit 1
else
    echo "Changing to ${TARGET}..."
    cd "$TARGET"
    if [ $? == "0" ]
    then
	
	mkdir $PICS
	mkdir $GIFS
	mkdir $VIDS
	mkdir $DOCS
	mkdir $MISC
	mkdir $WEBP
	
	check-for [Jj][Pp][Gg] $PICS
	check-for jpeg $PICS
	check-for gif $GIFS
	check-for webp $WEBP
	check-for mp4 $VIDS
	check-for mpg $VIDS
	check-for mpeg $VIDS
	check-for txt $DOCS
	check-for pdf $DOCS
	check-for md $DOCS
    fi
fi
