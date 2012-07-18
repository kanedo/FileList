#!/bin/bash
# For each file with the given extension in the current directory...
echo "Pfad;Datei;Groesse (in Byte)";
if [[ "x$1" == "x" ]]
then
	echo "no path given - exiting" >&2
	exit 1;
fi
find $1 -not -path */dev/* -type f -execdir bash -c 'echo -en "$PWD;$(basename {});$(stat -f %z {})\n"' \;