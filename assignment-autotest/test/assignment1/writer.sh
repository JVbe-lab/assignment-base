#!/bin/bash

writefile=$1
writestr=$2

if [ $# -lt 2 ]
then
	echo "ERROR: Invalid Number of Arguments."
	echo "Total number of arguments should be 2."
        echo "The order of the arguments should be:
		1) File Directory Path.
		2) String to be searched in the specified directory path."	
	exit 1
fi

echo $writestr > $writefile

