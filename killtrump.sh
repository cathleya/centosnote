#! /bin/bash

function killid(){
	ps -ef | grep $1 | grep -v grep | awk '{print $2}' | xargs kill -9
}

function main(){
	words=("Tump" "Donald" "vkpbfa4")
	for i in words; do
		killid $i
	done
}

main

# */15 * * * * sh /tmp/killtrump.sh