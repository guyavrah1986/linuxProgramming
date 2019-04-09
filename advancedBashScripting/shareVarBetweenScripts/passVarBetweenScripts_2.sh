#!/bin/bash

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

	echo "${log_prefix} - end"
} 

