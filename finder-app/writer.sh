#!/bin/bash

# Step 1: Verify parameters 
# Check if 2 arguments are provided
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <fullPath_fullName> <stringToWrite>"
    exit 1
fi
# The first argument is a path to a directory on the filesystem, referred to below as filesdir;
# The second argument is a text string which will be searched within these files
#save the parameters
fullPathandName=$"$1"
fileSystemDir=$(dirname "$1")
textContent="$2"
fileName=$(basename "$fullPathandName")

echo "fullPathandName = $fullPathandName"
echo "fileSystemDir = $fileSystemDir"
echo "textContent = $textContent"
echo "fileName = $fileName"
# Check if path exists

if [ ! -d "$fileSystemDir" ]; then
    echo "File and path : '$fullPathandName' created!"
    # Create all missing parent directories
    mkdir -p "$fileSystemDir"
    # Now write to the file
    echo "$textContent" > "$fullPathandName"
else 
    if [ ! -e "$fullPathandName" ]; then
        echo "File: '$fileName' created!"
        echo "$textContent" > "$fullPathandName"
    else 
        echo "File: '$fileName' updated!"
        echo "$textContent" > "$fullPathandName"
    fi
fi

