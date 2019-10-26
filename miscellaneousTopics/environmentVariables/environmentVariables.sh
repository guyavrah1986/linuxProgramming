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

currDir=$(pwd)
echo "current working directory is:$currDir"
my_env_var_name="MY_TMP_ENV_VAR"
export ${my_env_var_name}="12"
echo "created the following environment variable:${my_env_var_name}"
echo "its value is:"
printenv ${my_env_var_name}

echo "unsetting the environment variable that was created"
unset ${my_env_var_name}

echo "${green}==============================="
echo "$0 - end"
echo "${green}===============================${reset}"


