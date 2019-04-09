#!/bin/bash
####################################################################################################################################################################
####################################################################################################################################################################
# 
# 1) This is used to get the name of the INVOKED script. In case somewhere within this script we invoke another script, the "same script scope variable" as this
#    will have the same value of the "calling script" (you can think of it as if the second invoked script runs in the "context" of the invoking script, so 
#    every "global" settings will have the invoking script "values".
#
# 2) Once this command is done, the script CALLED_SCRIPT_NAME was "sourced" into this script, so every function/variable that is defined/declared in that 
#    script can be called/used in this current script. In the specific case that the "sourced" script contains ONLY function, you can think of it as a mechanism 
#    to "emulate" a "library" of shell functions.
#
# 3) This declares an associative array that can be "seen" by the other script (in this case I used the other script's function to fill it with values).
#####################################################################################################################################################################
#####################################################################################################################################################################


# global variables:
# -----------------
SCRIPT_NAME=${0##*/} # 1)
CALLED_SCRIPT_NAME="passVarBetweenScripts_2.sh"
declare -A ARR_1 # 3)


# functions:
# ----------

function pass_array_to_other_script {

	local log_prefix="${SCRIPT_NAME}::pass_array_to_other_script"
	echo "${log_prefix} - start"

	. ${CALLED_SCRIPT_NAME} # 2)  
	func_to_fill_array_with_values "first_arg_to_other_script"
	for i in "${!ARR_1[@]}"
	do
		echo "ARR_1[$i]:${ARR_1[$i]}"
	done
	
	echo "${log_prefix} - end"
} 


function main {

	local log_prefix="${SCRIPT_NAME}::main"
	echo "${log_prefix} - start"
	pass_array_to_other_script

	echo "${log_prefix} - end"
}

##############
# invoke main
##############

main
