#!/bin/sh

######################################################################
#
# Written by: Drew Limm (dtl2119)
#
######################################################################


######################################################################
#
# When given the file name and word to find as command line arguments,
# my program searches the file line by line until the first instance
# of the word is found, in which case it prints the line number where
# the word was found.  If it doesn't exist, it prints that the file 
# doesn't contain the word.  Also, it is worth noting that my search 
# is case sensitive.   
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

while read line
do
	if echo "$line" |grep -q $2
	then
		echo "Line #$lineCount contains $2"
		((count++))
		break
	fi
	((lineCount++))
done < $newFile

if [ "$count" = "0" ]
then
	echo "$1 does not contain $2"
fi



#################################### RESULTS ####################################
#
# war: Line #286 contains war
# budget: Line #80756 contains budget
# Cherokee: Line #717 contains Cherokee
# whiskey: <filename> does not contain whiskey
# Africa: Line #4299 contains Africa
# Australia: Line #58920 contains Australia
#
# NOTE: The file doesn't contain whiskey, but contains whisky
#
#################################################################################


