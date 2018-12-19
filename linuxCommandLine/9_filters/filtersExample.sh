#!/bin/bash

########################################################################
# ----------------------------------------------------------------------
# This script illustrate the basic concept and usage of fiters:
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
ls

fileName=sampleData.txt
echo "head $fileName"
head $fileName

echo ""
echo ""

# `head` example with specified number of lines
numOfLines=3
echo "head $numOfLines $fileName"
head -$numOfLines $fileName

echo ""
echo ""

# basic `sort` usage (default it sorting alphabetically)
echo "sort $fileName"
sort $fileName

echo ""
echo ""

# basic usage of `wc` with the -w option to return the number of words in the file
numOfWordsInFile=$(wc -w $fileName)
echo "$fileName has $numOfWordsInFile in it"

echo ""
echo ""

# usage of `cut` with delimiter and number of column otions provided
echo "cut -d ' ' -f 1,2 $fileName"
cut -d ' ' -f 1,2 $fileName

echo ""
echo ""

# basic usage of `uniq` (NOTE: it removed similar lines ONLY if they are adajcent)
uniqFileName=sampleDataForUniq.txt
echo "uniq $uniqFileName"
uniq $uniqFileName

echo ""
echo ""

echo ""
echo ""
echo "==================================="
echo "$0 - end"
echo "==================================="
