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

echo ""
echo ""

# 4) To print only the names of the files that DID contained at least one match to the searched pattern
# use the -l option.
pattern4=gry
echo "grep -r -l $pattern4 $inputFile"
grep -r -l $pattern4 $folderToSearch

echo ""
echo ""

# 5) Regular expression: Every regualr expression special character can be "treated" as 
# a "normal" character by adding the `\` in front of her.
echo "grep -r 'd.g' $folderToSearch"
grep -r 'd.g' $folderToSearch

echo ""
echo ""

echo "grep -r 'd\.g' $folderToSearch"
grep -r 'd\.g' $folderToSearch

echo ""
echo ""

# 6) Range and reptition "classes". For every case we use on of these "regualr expression classes" we MUST add the -E option.
# a) [a-z] - denotes a ragne of "possible" characters, in this case all the letters in their lower case form
# b) {11}  - denotes EXACT number of times that a "regualr expression class" MUST repeat itself. In this case it is EXCTLY 11 times.
echo "grep -r -E '[a-z]{11}' $folderToSearch"
grep -r -E '[a-z]{11}' $folderToSearch 

echo ""
echo ""

# 7) Special flags:
# a) Find pattern in the START of the line, we use the `^` flag:
echo "grep '^th' $inputFile"
grep '^th' $inputFile

echo ""
echo ""

# b) Find pattern in the END of the line, we use the `$` flag:
echo "grep 'i$' $inputFile"
grep 'i$' $inputFile

echo ""
echo ""

# c) Start of the word, we use the `\<` flag:
echo "grep '\<pra' $inputFile"
grep '\<pra' $inputFile

echo ""
echo ""

# d) End of the word, we use the `\>' flag:
echo "grep 'ne\>' $inputFile"
grep 'ne\>' $inputFile

echo ""
echo ""


echo "${green}==============================="
echo "$0 - end"
echo "${green}===============================${reset}"


