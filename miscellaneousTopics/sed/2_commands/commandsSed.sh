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

function checkIfFileExists {
	if [ -e $1 ]
	then
		echo "found $1 already exists, deleting it"
		rm $1
	fi
}

echo "${green}==============================="
echo "$0 - start"
echo "${green}===============================${reset}"

inputFile=input.txt
outputFile=output.txt
checkIfFileExists $outputFile

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

# in this example we simply replacing each occuerence of `one` with `ONE`.
# Some notes:
# -----------
# 1) s, in its simplest form (as in this case) applies its "replacement" action ONCE for every line.
sed s/one/ONE/ $inputFile >$outputFile




echo "${green}============================="
echo "$0 - end"
echo "${green}============================${reset}"
