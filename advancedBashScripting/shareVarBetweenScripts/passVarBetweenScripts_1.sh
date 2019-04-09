#!/bin/bash

# global variables:
# -----------------
SCRIPT_NAME=${0##*/}
declare -A ARR_1


# functions:
# ----------

function pass_array_to_other_script {

	local log_prefix="${SCRIPT_NAME}::pass_array_to_other_script"
	echo "${log_prefix} - start"

	echo "${log_prefix} - end"
} 


function main {

	local log_prefix="${SCRIPT_NAME}::main"
	echo "${log_prefix} - start"

	echo "${log_prefix} - end"
}

##############
# invoke main
##############

main
