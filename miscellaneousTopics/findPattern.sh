#!/bin/bash
source utilities.sh

#####################################################################################################
#####################################################################################################
# Global constants:
# -----------------
LOG_PREFIX="Find_Pattern"
DSWP_VERSION_EXTENSION=".out"
ST_VERSION_EXTENSION=".bin"

function Find_Patern_check_if_pattern_exists {

	local pattern=$1
	local input=$2
	local logPrefix="${LOG_PREFIX}::check_if_pattern_exists"	
	echo "${logPrefix} - about to check if pattern:${pattern} exists in:${input}"

	if [[ $input =~ $pattern ]];
	then
	    	echo "${green}${logPrefix} - found !!${reset}"
		return 0
	else
		echo "${red}${logPrefix} - was NOT found !!${reset}"
		return 1
	fi
}

function Find_Pattern_verify_valid_version_prefix {

	local versionPrefix=$1
	local logPrefix="${LOG_PREFIX}::verify_valid_version_prefix"	
	echo "${logPrefix} - got version prefix:${versionPrefix}"
	for i in "${UTILS_version_arr[@]}"
	do
	    if [ "$i" == "$versionPrefix" ]; 
  	    then
		echo "${green}${logPrefix} - version prefix is valid${reset}"
		return ${SUCCESS}
	    fi
	done

	echo "${red}${logPrefix} - version prefix is NOT valid${reset}"
	return ${ERROR}
}

function Find_Pattern_verify_st_version_prefix {

	local stVersionPrefix=$1
	local logPrefix="${LOG_PREFIX}::verify_st_version_prefix"
	echo "${logPrefix} - got ST version prefix to check $stVersionPrefix"
	for i in "${UTILS_st_bin_file_names_prefixes_arr[@]}"
	do
		#echo "${logPrefix} - about to check $i"
		Find_Patern_check_if_pattern_exists "$i" ${stVersionPrefix}
		local retCode=$?		
	    	if [ ${retCode} -eq 0 ]; 
  	    	then
			echo "${green}${logPrefix} - detected ST version:$i${reset}"
			return ${SUCCESS}
	    	fi
	done

	echo "${red}${logPrefix} - did NOT detect valid ST version${reset}"
	return ${ERROR}		
}

function Find_Pattern_extract_version {

	local logPrefix="${LOG_PREFIX}::extract_version"
	local inputLine=$1
	local fileType=$2 # i.e.- is it a .bin file name or 

	if [ fileType]
	
}

###################################################################################################################
###################################################################################################################

function test_pattern_exists {

	Find_Patern_check_if_pattern_exists "abc" "abcde"
	Find_Pattern_verify_valid_version_prefix "8.0"
	Find_Pattern_verify_valid_version_prefix "7.5"
	Find_Pattern_verify_valid_version_prefix "7.6"
	Find_Pattern_verify_valid_version_prefix "8.1"
	Find_Pattern_verify_valid_version_prefix ""
	Find_Pattern_verify_valid_version_prefix "aws3.5"
	Find_Pattern_verify_valid_version_prefix "8.0.90"	
}

function test_st_version_prefix {

	# GOOD versions
	Find_Pattern_verify_st_version_prefix "NPT1800_Emb_750024"
	Find_Pattern_verify_st_version_prefix "NPT1200i_Emb_800024"
	Find_Pattern_verify_st_version_prefix "NPT1050i_Emb_750024"

	# BAD versions
	Find_Pattern_verify_st_version_prefix "NPT1800"
	Find_Pattern_verify_st_version_prefix "NPT1500_Emb_750024"
	Find_Pattern_verify_st_version_prefix ""
	Find_Pattern_verify_st_version_prefix "NPT1050i_EMB_750024"
}

echo "tests - start"

#test_pattern_exists
test_st_version_prefix



echo "tests - end"
###################################################################################################################
###################################################################################################################
