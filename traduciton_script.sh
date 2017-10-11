#!/bin/bash		
list_file=$(find -type f)

for file in $list_file
do
	echo $FILE
	cat $file |grep "tooltip"
	sed -i "s/tooltip\(\ \)*: \('[]*\)'/tooltip\1: \l(\2')/g" "$file"
done
