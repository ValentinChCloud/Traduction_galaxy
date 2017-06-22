#!/bin/bash
#Take 2 arguments 
#Argument 1 : name of the file
#Argument 2 : field you want to change
#Example : title: "Profitez de vos Histoires Galaxy"
# bash script_final.sh core.history.yaml title
	word_list=$(cat $1 |grep "$2: *\".*\""|sed "s/.*\($2:\) *\"\(.*\)\"/\2/g"|sed "s/ /%/g")
	echo "step 1"
	for word in $word_list
	do
		word_modify=$(echo $word |sed "s/%/ /g")
		echo "Word modify $word_modify"
		echo "step 2"
		word_modify_translate=$(trans -brief :fr "$word_modify")
		echo " word_modify : $word_modify_translate"
		sed -i "s/\"$word_modify\"/\"$word_modify_translate\"/g" $1
	done

