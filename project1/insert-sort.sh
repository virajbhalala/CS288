#Write a bash script that sort wihout using any built in commands

#One way to save all argments in the array
lst=("$@")
    
for((i=1; i<$#; i++ )); do
    j=$i
    num=${lst[i]}
    while [ $j -gt 0 ]; do
	if [${lst[$j-1]} -gt $num ];then
	    lst[$j]=lst[$j-1]
	    let j--
	fi
	let j--
    lst[j]=num
    done

done
