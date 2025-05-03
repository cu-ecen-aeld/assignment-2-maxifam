#!/bin/bash

ARGNUM=2
WRITEFILE=$1
WRITESTR=$2
DIRPATH=$(dirname $WRITEFILE)

#checks the number of input arguments to ensure both arguments are provided
if [ $# -lt $ARGNUM ]
then
	echo "Error: Expected $ARGNUM arguments, got $#"
	exit 1	
fi

#checks if the directory exists, if not create it
if [ ! -d $DIRPATH ]
then 
	mkdir -p $DIRPATH
	if [ $? -eq 1 ]
	then
		echo "Directory could not be created"
		exit 1
	fi
fi
#if file does not exist, create a new file
if [ ! -f $WRITEFILE ]
then
	touch $WRITEFILE
	if [ $? -eq 1 ]
	then
		echo "File could not be created"
		exit 1
	fi
fi
echo $WRITESTR > $WRITEFILE
	
	
		
