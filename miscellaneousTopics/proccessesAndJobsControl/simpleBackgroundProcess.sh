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
while [ 0 -eq 0 ]
do
  echo "${blue}hello from script:${script_name}${reset}"
  sleep 10
done

echo "${green}===============================${reset}"
echo "${script_name} - end"
echo "${green}===============================${reset}"

