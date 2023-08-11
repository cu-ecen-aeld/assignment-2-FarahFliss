#!/bin/bash 


# Checking the correct number of arguments 
if [ $# -ne 2 ]; then 
	echo "Error: Script requires exactly 2 arguments!"
	exit 1
fi 

# Extract arguments

filesdir="$1"
searchstr="$2"

# Checking if $2 exists 

if [ ! -d "$filesdir" ]; then
	echo "Error: the provided path is not a valid  directory"
	exit 1
fi

# Init counters 
file_c=0
matching_lines_c=0

# Recursive search function
search_file() {
	for file in "$1"/*; do 
		file_c=$((file_c+1))
		if grep -q "$searchstr" "$file"; then 
			matching_lines_c=$((matching_lines_c+1))
		elif [ -d "$file" ]; then
		search_file "$file"
		fi 
done 
}

# Launching search 
search_file "$filesdir"

# Printing output 
echo "The number of files are $file_c and matching lines are $matching_lines_c"

