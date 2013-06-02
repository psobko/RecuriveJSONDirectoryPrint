#!/bin/bash

#recursively searches a folder for markdown files and exports the data to a JSON file
#each subfolder is set as a name, with it's value being an array of the contained files

#set parameters
targetDir="docs"
outputFile="./docindex.json"

#prepare the output file
rm $outputFile
touch $outputFile

addComma(){
  endLine=""
	if [ "$1" -lt "$2" ]
		then
		endLine=","
	fi
}

echo "{" >> $outputFile

dirs=($(find -E $targetDir -type d -maxdepth 1 -mindepth 1))
numDirs=${#dirs[@]}
indxDirs=1

for dir in ${dirs[*]}
do
	#print dir name, trimming the path
	dirname=${dir:(${#targetDir} +1)}
	echo "  \"$dirname\":" >> $outputFile
	echo "  [" >> $outputFile

	files=($(find -E $dir -type f -regex ".*\.(md$)" | sed 's!.*/!!'))
	numFiles=${#files[@]}
	indxFiles=1

	for item in ${files[*]}
	do
  	#check if comma is needed at the end of the line
		addComma $indxFiles $numFiles
  	
  	#print the file name
  	echo "    \"$item\"$endLine" >> $outputFile

    indxFiles=$[$indxFiles+1]
  done

	#check if comma is needed at the end of the line
	addComma $indxDirs $numDirs

	#close the JSON array
	echo "  ]$endLine" >> $outputFile

  indxDirs=$[$indxDirs+1]
done

echo "}" >> $outputFile

#psobko
