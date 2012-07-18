#!/bin/sh
# Bash script to get filename details | 16-06-2011 | r3dux
# Usage: fileParts <extension-with-no-dot> i.e. fileParts cpp

# For each file with the given extension in the current directory...
for file in $1/*; do

	# If a file exists with a given extension...
	if [ -e "$file" ]; then
		fullPath="$(perl -e 'use Cwd "abs_path";print abs_path(shift)' $file)"
		fileWithoutPath=$(basename $file)
		echo "Filename only                   is: " $fileWithoutPath
		pathWithoutFile="$(echo $fullPath | sed 's/'$fileWithoutPath'//g')"
		echo "Filepath only                   is: " $pathWithoutFile
		filesize=$(ls -ahl $file | awk '{ print $5 }')
		echo "Filesize only                   is: " $filesize
	else
		echo "No files of type $1 found!"
		exit 0

	fi # End of if file exists condition				

done # End of for each file loop