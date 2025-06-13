#!/bin/bash
# Check if both arguments are provided
if [ $# -ne 2 ]; then
    echo "Error: Two arguments required."
    echo "Usage: $0 <filesdir> <searchstr>"
    exit 1
fi
filesdir=$1
searchstr=$2
# Check if filesdir is a directory
if [ ! -d "$filesdir" ]; then
    echo "Error: '$filesdir' is not a valid directory."
    exit 1
fi
# Count number of files
file_count=$(find "$filesdir" -type f 2>/dev/null | wc -l)
if [ $? -ne 0 ]; then
    echo "Error: Failed to count files in '$filesdir'."
    exit 1
fi
# Count number of matching lines
match_count=$(grep -r "$searchstr" "$filesdir" 2>/dev/null | wc -l)
if [ $? -ne 0 ]; then
    echo "Error: Failed to search files in '$filesdir'."
    exit 1
fi

echo "The number of files are $file_count and the number of matching lines are $match_count"
exit 0

