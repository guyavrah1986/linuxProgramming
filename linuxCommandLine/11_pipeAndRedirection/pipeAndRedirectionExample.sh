#!/bin/bash

########################################################################
# ----------------------------------------------------------------------
# This script illustrate the basic concept and usage of pipes (|) and
# redirections:
# ----------------------------------------------------------------------
########################################################################

# this function is only used to return a value which is != 0
function foo1 {
	echo 1
}

# =======================================================================
# =======================================================================
# =======================================================================

echo "==================================="
echo "$0 - start"
echo "==================================="
echo ""
echo ""

currDir=$(pwd)
echo "currently we are at folder:$currDir"
echo "it contains the following items:"
ls 

echo ""
echo ""

# let flush all the names of all the files in the current folder to a file
outputFileName=lsOutput
ls > $outputFileName
echo "ls > $outputFileName gives us:"
cat $outputFileName

# !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
# IMPORTANT NOTE: the output file of the `ls` command will include the oputput file itself, even though
# it was NOT present at the begining
# !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

echo ""
echo ""

# in case we redirect the output to an already exising file, then the original file
# will be clread, then the new content will be written to it. This is done using the
# > opearator TWICE !!
wc -m $outputFileName >> $outputFileName
echo "wc -m $outputFileName >> $outputFileName"
cat $outputFileName

echo ""
echo ""

# in order to get info from a file, as an INPUT, we can use the < operator
# in this case, the provided file will "replace" the default STDIN as the 
# source of input to the command. 
# NOTE: in the example below, when we send the file as an input argument to the
# `wc` command, the file's name WILL NOT be part of the output (as it should in 
# its "normal" behaviour)
inputFileName=sampleInput.txt
words=$(wc -w $inputFileName)
echo "$inputFileName has $words in it"

echo ""
echo ""

# now when we will send the input file via the < operator, the `wc` command will NOT
# add the file's name as well, but ONLY the actual number of words 
words=$(wc -w < $inputFileName)
echo "when sending $inputFileName via the <, it has $words words in it"

echo ""
echo ""

# redirection on both "ways" can be combined within the same command:
wc -m < $inputFileName > testFile
cat testFile

echo ""
echo ""

# in case we wish to redirect both the ERROR MESSAGES & THE NORMAL output to a single file, we can do so like that:
nonExistingFile=noFile
errAndOutputFileName=errAndOutput.txt
ls -l $nonExistingFile $inputFileName > $errAndOutputFileName 2>&1
cat $errAndOutputFileName

echo ""
echo ""

# here we will illustrate the usage of several pipes combined
echo "ls"
ls
echo "ls | head -3 | tail -1"
ls | head -3 | tail -1

echo ""
echo ""

# here we use the `;` between the first command (the fucntion call)
# and the second command. In this case, the second command will be
# executed regardless of the return code value of the previous 
# command (note that foo returns 1). 
echo "calling foo1 followed by ; ls"
$foo1 ; ls

echo ""
echo ""

# here we use the `&&` between the first command (simulated `false`)
# and the second command. In this case, the second command will NOT be
# executed cause the return code value of the previous 
# command was NOT success. 
echo "emulating a false (non 0 return value) return value of some first command followed by && ls"
false && ls

echo ""
echo ""
echo "==================================="
echo "$0 - end"
echo "==================================="
