#!/bin/bash

filesdir=$1
searchstr=$2


# echo "looking for:" $1"/"$2

if [ $# -lt "2" ]
then
	echo "ERROR: Invalid Number of Arguments."
	echo "Total number of arguments should be 2."
        echo "The order of the arguments should be:
		1) File Directory Path.
		2) String to be searched in the specified directory path."	
	exit 1
fi	

if [ ! -d "$filesdir" ]
then
	echo "$filesdir is not represent a directory on the filesystem"
	exit 1
fi

if [ -d $filesdir ]
then
	echo "Number of files found in dir & subdir's '$filesdir': $(find $filesdir/. -type f  | wc -l)"
	echo "Search string '$searchstr' found in:  $(ls -lr $filesdir | grep $searchstr . -R | wc -l)"
	exit 0
else
	echo "File not found"
	exit 1
fi
