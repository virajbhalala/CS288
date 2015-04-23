#!/bin/bash

file="index.html"
output="output.csv"
list_title=(); 
title_count=0; 
list_views=();
 view_count=0;

#create files
echo "">$output
echo "">output_title.txt
echo "">output_views.txt;
echo "">output_author.txt;
echo "">output_Durationpush.txt;


function grep_views(){
	echo "" > output.txt

	grep views $file | 
	while read line; do
		x=`expr "$line" : ".*<li>\(.*\) views</li>"`
		x=${x//,/}
		echo "$x" >> output_views.txt;
	done	
}

function grep_title(){
	grep "title=\"\(.*\) aria-describedby" $file | grep -v \&# |
	while read line; do
				#get whatever is in these brackets
		x=`expr "$line" : ".*title=\(.*\) aria-describedby"`
		x=${x//,/}
		echo "$x" >> output_title.txt;
	done
}
function grep_author(){
	grep "by\(.*\)</a>&nbsp;" $file |
	while read line; do
		x=`expr "$line" : ".*\">\(.*\)</a>&nbsp;"`
		echo "$x" >> output_author.txt;
		#echo $x;
	done
}

function grep_Duration(){
	grep "\- Duration: \(.*\).</span>" $file |
	while read line; do
		x=`expr "$line" : ".*Duration: \(.*\).</span></h3>"`
		#echo "$x" >> output_author.txt;
		echo $x;
		#echo $line;
	done
}


function main(){
	grep_title
	grep_views
	grep_author
	grep_Duration
	count=0;
	echo "Output is saved"


#writes on CSV file
	while read LINE; do
		list_title[title_count]=$LINE;
		((title_count++));
	done < output_title.txt
	
	while read LINE; do
		list_views[view_count]=$LINE;
		((view_count++));
	done < output_views.txt
#get the highest count. It will be used to write in Csv file	
	[ $title_count -lt $view_count ] && count=$title_count || count=$view_count;	

#write it in CSV file
	for ((i=0; i<$count; i++));do
		echo "${list_views[$i]},${list_title[$i]}" >> $output	
	done
}


main
