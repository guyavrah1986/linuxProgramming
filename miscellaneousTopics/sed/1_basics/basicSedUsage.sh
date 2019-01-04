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

# this is the simples way to use SED - simply output all the content of the file to STDOUT
# the sed usage is as follows:
# sed '<command(s)>' <file_name> , i.e.-
# '<command(s)>': Are the set of "sed commands" that will be invoked on EVERY line in the "pattern buffer".
# <file_name>: is the name of the file that will "provide" the input (i.e.- STDIN or pipe is also legit as we mentioned).
fileName=file1.txt
echo "echo-ing using sed:"
echo "--------------------"
sed '' $fileName

echo ""
echo ""

# in this example we will use the "delete" command of sed
# note that every "delete" command needs to be prefixed with a '-e' notation
echo "before applying sed's delete command, $fileName has:"
echo "----------------------------------------------------"
cat $fileName

echo "now, we are about to delete the first and third rows"
sed -e '1d' -e '3d' $fileName

echo "${green}============================="
echo "$0 - end"
echo "${green}============================${reset}"
