#!/bin/bash

#scans the "docs" folder and recursively returns all markdown files in an assosciative array which is then converted to JSON and stored in a flat file

#declare target output file
out="./docindex.json"

#clean up first
rm $out
touch $out

#start printing to the file
printf "{\"Docs:\": [\n" >> $out
dirs=($(find -E docs -type d -maxdepth 1 -mindepth 1))
for dir in ${dirs[*]}
do
  dirname = $dir 
  printf "{\"%s\": [\n" $dir >> $out
  files=($(find -E $dir -type f -regex ".*\.(md$)" | sed 's!.*/!!'))
  for item in ${files[*]}
  do
    printf "{ \"%s\"},\n" $item >> $out
  done
  printf "]},\n" >> $out
done
printf "]}" >> $out

#psobko
