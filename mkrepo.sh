#!/bin/bash

# sets up new github repo #

REPO=$1

if [ $REPO = help ]
then
    echo "Usage ./mkrepo.sh [repo name]"
else
    read -p "Create local git repository in directory ${REPO}? [y/n]" ANS
    case "$ANS" in
	[yY])
	    git init $REPO
	    echo "Creating README.txt"
	    touch ${REPO}/README.txt
	    echo "Creating .gitignore file"
	    touch ${REPO}/.gitignore
	    echo "Changing to repository"
	    cd $REPO
	    ls -la
	    echo "Adding new files..."
	    git add .gitignore README.txt
	    git status
	    echo "Creating Intial Commit..."
	    git commit -m "Intial Commit"
	    git status
	    echo "Setup Complete."
	    exit 0
	    ;;
	[nN])
	    echo Cancelling...
	    exit 1
	    ;;
	*)	      
	    echo "Invalid input, Cancelling..."
	    exit 2
	    ;;
    esac
    
fi
