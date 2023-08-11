#!/bin/bash


#Check number of arguments
if [ $# -ne 2 ]; then 
	echo "Error: Script requires exactly 2 arguments."
	exit 1;
fi 

#Extract argument into variables 
writefile="$1"
writestr="$2"

#Check if the path exists 
if [ ! -d "$(dirname "$writefile")" ]; then
	echo "The file could not be created"
	exit 1
fi

#Creates or overwrite file if existing with writestr 
echo "$writestr" > "$writefile"

echo "File created or overwritten: $writefile"




