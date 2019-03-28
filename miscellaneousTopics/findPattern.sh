#!/bin/bash
source utilities.sh

function Find_Patern_check_if_pattern_exists {

	local pattern=$1
	local input=$2
	echo "Find_Patern_check_if_pattern_exists - about to check if pattern:${pattern} exists in:${input}"

	if [[ $input =~ $pattern ]];
	then
	    	echo "${green}Find_Patern_check_if_pattern_exists - found !!${reset}"
		return 0
	else
		echo "${red}Find_Patern_check_if_pattern_exists - was NOT found !!${reset}"
		return 1
	fi
}


echo "tests"
Find_Patern_check_if_pattern_exists "abc" "abcde"
echo "tests end"
