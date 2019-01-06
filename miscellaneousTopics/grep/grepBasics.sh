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

echo "${green}==============================="
echo "$0 - start"
echo "${green}===============================${reset}"

currDir=$(pwd)
inputFile=inputFile.txt
echo "current working directory is:$currDir"
echo "The contents of the file we will use as input are:"
echo "--------------------------------------------------"
cat $inputFile

echo ""
echo ""

# 1) The basic format of the grep utility is as follows:
# $ [options] [regexp] [filename]
# options  - specific "variations" of the grep utility.
# regexp   - a regualr expression to search for in the input stream.
# filename - the file name that we will use as an input
# In the following example we will illustrate the "in-sensetive" case option - i.e. search
# for a pattern regardless of the case sensitivity.
pattern1=abcd
echo "grep -i $pattern1 $inputFile"
grep -i $pattern1 $inputFile

echo ""
echo ""

# 2) Every time we use grep - if indeed it finds the pattern, it returns the 
# entire line where it was found.
# In this case we use the -w option which tells grep to return lines ONLY if the 
# searched pattern was found completly as "a whole" word.
pattern2=test
echo "grep -w $pattern2 $inputFile"
grep -w $pattern2 $inputFile

echo ""
echo ""

# 3) To serach recursively starting from a praticular location (folder) and 
# downwards, we can use the -r option.
pattern3=dog
folderToSearch=. # current directory
echo "grep -r $pattern3 $folderToSearch"
grep -r $pattern3 $folderToSearch


echo "${green}==============================="
echo "$0 - end"
echo "${green}===============================${reset}"


