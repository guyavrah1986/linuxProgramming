#!/bin/bash

#===============================================================================================================================
#===============================================================================================================================
# constants
# --------
red=`tput setaf 1`
green=`tput setaf 2`
reset=`tput sgr0`
#===============================================================================================================================
#===============================================================================================================================

function checkIfFileOrFolderExists {
	local numOfArgs=$#
	if [ $numOfArgs -lt 2 ]
	then
		echo "not enough arguments, aborting"
		return 1
	fi

	if [ -$2 $1 ]
	then
		rmArg=""
		echo "found that $1 already exists, deleting it"
		if [ "$2" = "d" ]
		then
			echo "got the $2 additional argument"
			rmArg="-rf"		
		fi
		
		sudo rm $rmArg $1
	fi
}

echo "${green}==============================="
echo "$0 - start"
echo "${green}===============================${reset}"

inputFile=input.txt
outputFile=output.txt
subFolder1=folder1
subFolder2=folder2
checkIfFileOrFolderExists $outputFile "e"
#checkIfFileOrFolderExists $subFolder1/$subFolder2 "d"
#currDir=$(pwd)
#mkdir -p $currDir/$subFolder1/$subFolder2/
#cd $currDir/$subFolder1/$subFolder2/
#fileName=someFile
#touch $fileName 
#echo "blash blash" >$fileName
#cd $currDir

echo "input file has the following content:"
echo "-------------------------------------"
cat $inputFile

echo ""
echo ""

# 1) The subsitute command. Noted by the letter `s`. Has four "components:
# a) s - the sed's command
# b) patternString - the pattern to look for in the input stream.
# c) replacementString - the pattern to replace in the final "outcome".
# d) / - delimiter(s)

patternString=one
replacementString=ONE

# 1) in this example we simply replacing each occuerence of `one` with `ONE`.
# Some notes:
# -----------
# s, in its simplest form (as in this case) applies its "replacement" action ONCE for every line.
sed s/one/ONE/ $inputFile >$outputFile


# 2) in this example we use the '\' (backslash) in order to indicate that the
# forward slash is part of the argument and NOT the "normal" delimiter
#rename s/\/$currDir\/$subFolder1\/$subFolder2\/$fileName/\/$currDir\/$subFolder1\/$subFolder2\/newFileName/

# 3) In case you wish to replace a pattern which you don't know what it 
# is in "advance", YET only when you will indeed encounter it, you can use he `&` character:
ampersandOutputFile=ampersendFile
sed 's/[0-9]*/& &/' $inputFile >$ampersandOutputFile
echo "after searching for numbers strings, we get:"
cat $ampersandOutputFile


echo "${green}============================="
echo "$0 - end"
echo "${green}============================${reset}"
