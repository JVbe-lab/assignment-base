#!/bin/bash

# Step 1: Verify parameters 
# Check if 2 arguments are provided
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <directory> <search_string>"
    exit 1
fi
# The first argument is a path to a directory on the filesystem, referred to below as filesdir;
# The second argument is a text string which will be searched within these files
#save the parameters
fileSystemDir="$1"
textString="$2"

# Check if directory exists
if [ ! -d "$fileSystemDir" ]; then
    echo "Error: Directory '$fileSystemDir' not found!"
    exit 1
fi

echo "File System Directory: $fileSystemDir"
echo "Text String: $textString"

#Prints a message "The number of files are X and the number of matching lines are Y" 
#where X is the number of files in the directory and all subdirectories and Y is the number 
#of matching lines found in respective files, where a matching line refers to a line which contains 
#searchstr (and may also contain additional content).

# Search for text in files "2>/dev/null" Redirects error messages to "nowhere" (silences them)
echo "Searching for '$textString' in '$fileSystemDir'..."
grep -r "$textString" "$fileSystemDir" 2>/dev/null

# Count all files (X)
fileCount=$(find "$fileSystemDir" -type f | wc -l)
# Count matching lines (Y)
matchLinesCount=$(grep -r "$textString" "$fileSystemDir" 2>/dev/null | wc -l)
matchingFilesCount=$(grep -rl "$textString" "$fileSystemDir" 2>/dev/null | wc -l)

#Print info
echo "Total files to seek '$textString': $fileCount"
echo "Total match lines : $matchLinesCount"
echo "Total match files : $matchingFilesCount"