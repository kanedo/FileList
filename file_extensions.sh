#!/bin/sh
# Bash script to get filename details | 16-06-2011 | r3dux
# Usage: fileParts <extension-with-no-dot> i.e. fileParts cpp

# For each file with the given extension in the current directory...
for file in ./*; do

	# If a file exists with a given extension...
	if [ -e "$file" ]; then
		fileWithoutPath=$(basename $file)
		extension=${fileWithoutPath##*.}
		echo $extension
	else
		echo "No files of type $1 found!"
		exit 0

	fi # End of if file exists condition				

done # End of for each file loop