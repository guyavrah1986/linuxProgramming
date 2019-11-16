#!/bin/bash

#===============================================================================================================================
#===============================================================================================================================
# constants
# --------
red=`tput setaf 1`
green=`tput setaf 2`
blue=`tput setaf 4`
reset=`tput sgr0`
#===============================================================================================================================
#===============================================================================================================================
script_name=$0

echo "${green}===============================${reset}"
echo "${script_name} - start"
echo "${green}===============================${reset}"

currDir=$(pwd)
echo "current working directory is:$currDir"
env_var_name="TEST"
export ${env_var_name}=1

echo "${blue} created an ENV variable called:${env_var_name}, with value of:"
printenv ${env_var_name}
echo "${blue} switching to sudo user"
#sudo su -
# echo "${blue} now, the value of the env var:${env_var_name} is:" --> would not print anything
# printenv ${env_var_name}
# exit --> to get back to the initial user (guya)


echo "${green}===============================${reset}"
echo "${script_name} - end"
echo "${green}===============================${reset}"
