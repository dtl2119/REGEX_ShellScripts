#!/bin/sh

######################################################################
#
# Written by: Drew Limm (dtl2119)
#
######################################################################


######################################################################
#
# When given the file name and word to find as command line arguments,
# my program searches line by line for the word, keep track of which
# speech (identified by name/date) is being searched.  If an instance 
# of the word is found, it prints the line number, president name, and
# date of the speech.  By adding the -i to the grep command, the word
# search is not case sensitive.  
# 
######################################################################

### $1 is the file to search
### $2 word to search


if [ "$#" -ne 2 ] 
then
	echo "Must have 2 arguments (Filename then Word)"
	exit 1
fi 


lineCount=1
count=0
newFile=$1
echo "\n" >> $newFile # Add new line to end of file (so last line is checked)
name="Introduction (Before 1st Speech)"
date="Introduction (Before 1st Speech)"
nameIndex=1
dateIndex=1

while read line
do
	if echo "$line" | egrep -q '^\*\*\*$'
	then
		nameIndex=`echo "$lineCount+3" |bc`
		dateIndex=`echo "$lineCount+4" |bc`
		name=$(sed -n -e "${nameIndex}p" -e "${nameIndexq}" $1)
		date=$(sed -n -e "${dateIndex}p" -e "${dateIndexq}" $1)
		
	fi
	if echo "$line" |grep -q -i $2
	then
		echo "Line #$lineCount contains $2"
		echo "President Name: $name"
		echo "Date: $date"
		echo ""
		((count++))
	fi
	((lineCount++))
done < $newFile

if [ "$count" = "0" ]
then
	echo "$1 does not contain $2"
fi


