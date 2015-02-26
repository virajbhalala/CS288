#!/bin/bash

: 'Write a Bash script, count.sh, which builds a table of counters for the commands under /bin in 
alphabetical order. For example, there are 9 commands starting with "a" (a2p addftinfo addr2line 
apropos ar arch as ash awk) while there are 11 commands starting with "z" (zcat zcmp zdiff zegrep
 zfgrep zforce zgrep zless zmore znew zsoelim). Exclude commands starting with non-alphabets
 such as "[." Your script will print
a 9
...
...
...
z 11
Use loop and array to design and implement this script.
'

cd /bin
l=(ls /bin)
count=0
for x in {a..z};
do
    for y in $x*;do
	if  [ "$y" != "$x*" ]; then
	let "count++"
      # echo $y
	 fi
     done
    if  [ $count != 0 ]; then
	echo $x : $count
	let "count=0"
    fi
done
