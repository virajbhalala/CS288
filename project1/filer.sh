#!/bin/sh

average(){
    sizes=( `du -hb --max-depth=1 ~ | cut -f 1` )
    num=$((${#sizes[@]}-1))
    sum=(${sizes[$num]})
    array=(`du -hb --max-depth=1 ~ | cut -f 2 `)
    avg=$((sum/num))
    

    echo ${sizes[@]}
    echo ${array[@]}
    echo $sum
    echo $num
    echo $avg
}

filter()
{ 
    for ((i=0; i < $num; i++))
    do
	if (( sizes[i] >= avg ))
	then
	    echo ${array[i]}
	fi
    done
}

main()
{
    average
    filter
}

main
