#!/bin/bash
: 'Write a Bash script, reverse.sh, which reverses the contents of a directory
 passed as a parameter. Assuming /my/dir contains "cache cron games lib log
 run tmp," your program "reverse.sh /my/dir" will return "tmp run log lib 
games cron cache." Use an array and two functions: main() and reverse(). You
 will manually manipulate the list as we did today. DO NOT use the built-in
 command sort -r.Write a Bash script, reverse.sh, which reverses the contents
 of a directory passed as a parameter. Assuming /my/dir contains "cache cron
 games lib log run tmp," your program "reverse.sh /my/dir" will return "tmp
 run log lib games cron cache." Use an array and two functions: main() and 
reverse(). You will manually manipulate the list as we did today. DO NOT use
 the built-in command sort -r.'


function reverse(){
cd
 local p=$1
#check wheter file exists
    if [ -d $p ]; then
	lst=(`ls $p`)
	rev=()
#find the size fo lst
	size=${#lst[@]}
	for x in ${lst[@]}; do
	    ((size--))
	    rev[$size]=$x
	done
#echo them
	for y in ${rev[@]}; do
	    echo $y
	done
    fi
}

function main(){
local p=$1
#check wheter directory exist and call reverse function
[ -d $p ]&& reverse $p
}
main $1
