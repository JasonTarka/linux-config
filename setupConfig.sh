#!/bin/bash

DIR="$( cd "$( dirname "$0" )" && pwd )"
DIR="${DIR}/configFiles"

# Make sure the directory exists
if [ -d $DIR ]; then
	echo "Using config files in ${DIR}"
else
	echo "Could not locate config files directory. Tried: ${DIR}"
	exit 1
fi

for file in ${DIR}/*; do
	HOME_FILE="$HOME/.$( basename $file )"

	if [ -f $HOME_FILE ]; then
		echo "Appending '$file' to '$HOME_FILE"
		echo "" >> $HOME_FILE
		cat "$file" >> "$HOME_FILE"
	else
		echo "$HOME_FILE does not exist. Skipping."
	fi
	
	
done