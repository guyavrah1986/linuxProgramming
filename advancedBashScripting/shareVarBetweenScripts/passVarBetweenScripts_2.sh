#!/bin/bash
####################################################################################################################################################################
####################################################################################################################################################################
# 
# 1) Here the array (that is "seen" by this script from the invoking script) is filled with two values. Note that the values that are being set are NOT enclosed 
#    within the "".  
#####################################################################################################################################################################
#####################################################################################################################################################################

# global variables:
# -----------------
SCRIPT_NAME=${0##*/}

echo "blalalala"

# functions:
# ----------

function func_to_fill_array_with_values {

	local log_prefix="${SCRIPT_NAME}::func_to_fill_array_with_values"
	local arg1=$1
	echo "${log_prefix} - start"
	echo "${log_prefix} - got arg1:${arg1}"

	ARR_1["index_1"]="val_1"     # this line implicitly makes it an associative array (in global scope, bash 4.2+ only)
	ARR_1["index_2"]="val_2"    # Can add multiple values one by one
	
	echo "${log_prefix} - end"
} 

