#Write a bash script that sort wihout using any built in commands

#One way to save all argments in the array
#lst=("$@")
lst=()

for x in $@; do
	pos=0
	for value in ${lst[@]}; do
		if [ $x -lt $value ]; then
			temp=${vals[$pos]}
			lst[$pos]=$x
			x=$temp
		fi
		let cursor++
	done
	lst+=($x)
done

echo ${lst[@]}
