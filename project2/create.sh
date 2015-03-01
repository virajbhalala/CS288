#!/bin/bash
function depthfirst {
	local depth=$1
	local breadth=$2
	local dir=$3
	
	if [ $depth -le 0 ]; then 
		return
	fi
	let depth--
	local tempbreadth=$breadth

	while [[ $tempbreadth > 0 ]]; do
		mkdir $dir/$tempbreadth
		depthfirst $depth $breadth $$dir/$tempbreadth
		let tempbreadth--
	done


}

function breadthfirst {
	local depth=$1
	local breadth=$2
	local dir=$3
	if [ $depth -le 0 ]; then 
		return
	fi
	let depth--
	local tempbreadth=$breadth
	while [[ $tempbreadth > 0 ]]; do
		mkdir $dir/$tempbreadth
		let tempbreadth--
	done
	
	let tempbreadth=$breadth
	while [[ $tempbreadth > 0 ]]; do
		breadthfirst $depth $breadth $dir/$tempbreadth
		let tempbreadth--
	done

	
	


}

# $1      $2     $3   $4
#depth# breadth# dir type <-parameters


if [ $4=="breadth" ]; then
	breadthfirst $1 $2 $3

elif [ $4=="depth" ]; then
	depthfirst $1 $2 $3
fi



#run the program using statement similar to this ./create.sh 4 3 $HOME/tree depth

