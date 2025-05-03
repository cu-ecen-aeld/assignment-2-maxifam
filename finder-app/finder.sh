#!/bin/bash

ARGNUM=2
FILESDIR=$1
SEARCHSTR=$2


#checks the number of input arguments to ensure both arguments are provided
if [ $# -lt $ARGNUM ]
then
	echo "Error: Expected $ARGNUM arguments, got $#"
	exit 1
fi

#checks if the provided dir is valid
if [ ! -d $1 ]
then
	echo "Error: $FILESDIR is not a valid directory"
	exit 1
else
	FILESNUM=$(find $FILESDIR -type f | wc -l)
	LINESNUM=$(grep -r $SEARCHSTR $FILESDIR | wc -l)
	echo "The number of files are $FILESNUM and the number of matching lines are $LINESNUM"
	echo
fi





 
