#!/bin/bash

########################################################################
# ----------------------------------------------------------------------
# This script illustrate the basic concept and usage of wild cards
# in Bash commands:
# ----------------------------------------------------------------------
########################################################################

echo "$0 - start"
echo "$0 - current folder contains the follolwing items:"
echo "==================================================================="
ls | sort

letterPattern=f
echo "$0 - disaply all files/folders that their names begins with the leeter $letterPattern"
ls f*

extensionPattern=txt
echo "$0 - disaply all files/folders that their names ends with the extnsion $extensionPattern"
ls *.$extensionPattern

secondLetterPattern=i
echo "$0 - disaply all files/folders that their name's second letter is $secondLetterPattern"
ls ?$secondLetterPattern*

echo "$0 - disaply all files/folders that their name's start with either on of the letters:a,v,g "
ls [avg]*

echo "$0 - disaply all files/folders that their name's DOES NOT start with either on of the letters in the range:a-f "
ls [^a-f]*

echo "$0 - end"
