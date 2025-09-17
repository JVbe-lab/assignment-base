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

if [ -d "$filesdir" ]
then
	echo "$filesdir is not represent a directory on the filesystem"
	#exit 1
fi



if [ -d $filesdir ]
then
	#echo "File found in dir $filesdir"
	#echo "$(ls)" 
	echo "Number of files in directory $filesdir: $(ls -1r $filesdir | wc -l)" 
	echo "Search string found in:  $(ls -lr $filesdir | grep 
	exit 0
else
	echo "File not found"
	exit 1
fi
