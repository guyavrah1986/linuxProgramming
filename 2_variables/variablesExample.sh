#!/bin/bash

########################################################################
# ----------------------------------------------------------------------
# This script illustrate the concept and usage of bash script variables:
# ----------------------------------------------------------------------
########################################################################

script_name=$0
first_arg=$1
second_arg=$2

echo "script name is:$script_name"
echo "first arg recived is:$first_arg"
echo "second arg recived is:$second_arg"

var1=Roei
var2="Rotem Hasid"
var3=Eldar
echo "var1 var3 are: $var1 $var3"
echo "var2:$var2"

# saving the "output" of a command into a variable
lsEtcRes=$( ls /etc | wc -l )
echo "There are $lsEtcRes files/folders under /etc"

# exporting var1 & var2 to another script (that will be run in another process)
echo "within $0, var1:$var1, var2:$var2"
export var1 
export var2
./invokedScript.sh
echo "back within $0,var1 var3:$var1 $var3, var2:$var2"


