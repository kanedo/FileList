#!/bin/sh
# Bash script to get filename details | 16-06-2011 | r3dux
# Usage: fileParts <extension-with-no-dot> i.e. fileParts cpp

# For each file with the given extension in the current directory...
echo "Pfad;Datei;Groesse";
for file in $(find $1); do

	# If a file exists with a given extension...
	if [ -e "$file" ]; then
		if [ ! -d "$file" ]; then
			fullPath="$(perl -e 'use Cwd "abs_path";print abs_path(shift)' $file)"
			fileWithoutPath=$(basename $file)
			pathWithoutFile="$(echo $fullPath | sed 's/'$fileWithoutPath'//g')"
			filesize=$(ls -ahl $file | awk '{ print $5 }')
			
			echo $pathWithoutFile";"$fileWithoutPath";"$filesize
		fi;
	else
		#echo "No files of type $1 found!"
		exit 0

	fi # End of if file exists condition				

done # End of for each file loop