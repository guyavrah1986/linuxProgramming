#!/bin/bash

function foo {

	local arg1=$1
	local arg2=$2
	local arg3=$3
	echo "foo - got arg1:${arg1}, arg2:${arg2}, arg3:${arg3}"
	echo "foo - about to sleep for ${arg3} seconds"
	sleep ${arg3}  # Waits 5 seconds.
	echo "foo - end"
}

#set -o errexit

function main {

	echo "=========="
	echo "main - start"
	echo "=========="
	
	foo "172.30.82.111" "1800" 5 &
	pid1=$!
	echo "main - lanuched background thread ID:${pid1}"
	foo "172.30.82.112" "1200" 1 &
	pid2=$!
	echo "main - lanuched background thread ID:${pid2}"
	foo "172.30.82.113" "1050" 3 &
	pid3=$!
	echo "main - lanuched background thread ID:${pid3}"

	wait $pid1 && echo "main done waiting to pid:${pid1} which exited normally" || echo "main - pid:${pid1} exited abnormally with status $?"
	wait $pid2 && echo "main done waiting to pid:${pid2} which exited normally" || echo "main - pid:${pid2} exited abnormally with status $?"
	wait $pid3 && echo "main done waiting to pid:${pid3} which exited normally" || echo "main - pid:${pid3} exited abnormally with status $?"

	echo "=========="	
	echo "main - end"
	echo "=========="
}


# invoke main
main 

