#!/bin/bash

# sets up new github repo #

SCRIPT=$0
REPO=$1
USAGEMSG="Usage: $SCRIPT <repo-name>"


if [ "$REPO" = "" ]
then
    echo "$USAGEMSG"
else
    read -p "Create local git repository in directory ${REPO}? [y/n]" ANS
    case "$ANS" in
	[yY]*)
	    git init $REPO
	    echo "Creating README.md"
	    touch ${REPO}/README.md
	    echo "Creating .gitignore file"
	    touch ${REPO}/.gitignore
	    echo "Changing to repository"
	    cd $REPO
	    ls -la
	    echo "Adding new files..."
	    git add .gitignore README.md
	    git status
	    echo "Creating Intial Commit..."
	    git commit -m "Intial Commit"
	    git status
	    echo "Setup Complete."
	    cd ..
	    ls -la
	    exit 0
	    ;;
	[nN]*)
	    echo Cancelling...
	    exit 1
	    ;;
	*)	      
	    echo "Invalid input, Cancelling..."
	    exit 2
	    ;;
    esac    
fi
