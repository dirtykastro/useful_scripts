#!/bin/bash

FOLDERSLIST="AmazonPolly Ardour Master/Mixed Master/Stems Master/Mastered Reason Video/Render Video/StoryBlocks Video/Badge"

for FOLDER in $FOLDERSLIST; do
	if [ -d $FOLDER ];
	then
		echo "$FOLDER already exists"
	else
		mkdir -p $FOLDER
	fi
done


# Define a string variable with a value
GITIGNORELIST=".DS_Store Video/Badge"

GITIGNOREFILE=".gitignore"

for IGNORE in $GITIGNORELIST; do
	if [ -f $GITIGNOREFILE ];
	then
		if grep -q "$IGNORE" "$GITIGNOREFILE";
		then
			echo "$IGNORE already in $GITIGNOREFILE"
		else
			echo "$IGNORE" >> $GITIGNOREFILE
		fi	

	else
		echo "$GITIGNOREFILE doesn't exist"
	fi
done
