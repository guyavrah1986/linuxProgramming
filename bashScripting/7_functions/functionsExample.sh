#!/bin/bash

########################################################################
# ----------------------------------------------------------------------
# This script illustrate the basic concept and usage of functiopns in
# bash scripts:
# ----------------------------------------------------------------------
########################################################################

# !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
# NOTE:There MUST be SINGLE space between the function name and the openning {
# !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function func1 {
	echo "hey there from func1"
}

# !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
# NOTE:There MUST be SINGLE space between the function name and the () as well
# as between the () and the openning {
# !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
func2 () {
	echo "hey there from func2 - got $# arguemnts"
	numArg=1	
	for arg in $@
	do
		echo "arg $numArg): $arg"
		((numArg++))
	done
}

# we can (and should) decalre local variables within functions to indeed
# be local by using the keyword `local` ONLY upon first declration.
function func3 {
	local var1=var1_local
	var2=var2_local
	echo "within func3 var1:$var1 , var2:$var2"
}
	

echo "========================================="
echo "$0 - start"
echo "========================================="

# to invoke a function we simply write (ONLY) its name !!
echo "calling func1 without any arguments"
func1

echo ""
echo ""

# we can pass a list of arguments to a function.
argsList="Arg1 Arg2 17 calbas"
echo "calling func2 with arguments"
func2 $argsList

echo ""
echo ""

var1=var1_global
var2=var2_global
echo "BEFORE calling func3, var1:$var1, var2:$var2"
echo "calling func3"
func3
echo "AFTER calling func3, var1:$var1, var2:$var2"

echo "========================================="
echo "$0 - end"
echo "========================================="


