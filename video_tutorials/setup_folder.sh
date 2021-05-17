#!/bin/bash

GITIGNOREFILE=".gitignore"

if [ -f $GITIGNOREFILE ];
then
	echo "$GITIGNOREFILE exists. Proceed with the folder setup"
else
	echo "$GITIGNOREFILE doesn't exist"
	exit 1
fi


FOLDERSLIST="Render DaVinci ScreenCaptures StoryBlocks AudioBlocks Subtitles Music"

for FOLDER in $FOLDERSLIST; do
	if [ -d $FOLDER ];
	then
		echo "$FOLDER already exists"
	else
		mkdir -p $FOLDER
	fi
done


# Define a string variable with a value
GITIGNORELIST=".DS_Store"

for IGNORE in $GITIGNORELIST; do
	if grep -q "$IGNORE" "$GITIGNOREFILE";
	then
		echo "$IGNORE already in $GITIGNOREFILE"
	else
		echo "$IGNORE" >> $GITIGNOREFILE
	fi	
done
