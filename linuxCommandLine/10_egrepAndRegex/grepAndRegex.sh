#!/bin/bash

########################################################################
# ----------------------------------------------------------------------
# This script illustrate the basic concept and usage of grep and regualr
# expressions:
# ----------------------------------------------------------------------
########################################################################

echo "==================================="
echo "$0 - start"
echo "==================================="
echo ""
echo ""

currDir=$(pwd)
echo "currently we are at folder:$currDir"
echo "it contains the following items:"

fileName=sampleData.txt
echo "displaying entire content of file:$fileName"
cat $fileName

echo ""
echo ""

# the most basic usage of egrep:print every LINE that contains the provided pattern
echo "egrep 'mellon' $fileName"
egrep 'mellon' $fileName

echo ""
echo ""

# now, print the line numbers as well
echo "egrep -n 'mellon' $fileName"
egrep -n 'mellon' $fileName

echo ""
echo ""

# find any line with TWO voues in a row (next to each other)
echo "egrep '[aeiou]{2,}' $fileName"
egrep '[aeiou]{2,}' $fileName

echo ""
echo ""

# number 2 as the last character in the line
echo "egrep 2$ $fileName"
egrep "2$" $fileName


echo ""
echo ""

# each line that contains 'su', 'be' OR 'or'
echo "egrep 'or|su|be' $fileName"
egrep "or|su|be" $fileName


echo ""
echo ""

# basic usage of the `find` command - list all the files in the current folder
# and all its sub-folders that terminates with the extension '*.txt' (note that the
# pattern to look is sourounded with single quote.
echo pwd
extension=".txt"
echo "listing all file with extension:$extension" 
find . -type f -name '*.txt'


echo ""
echo ""
echo "==================================="
echo "$0 - end"
echo "==================================="
