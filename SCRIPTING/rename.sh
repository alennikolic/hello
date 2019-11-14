#!/bin/bash


FILES="/etc/*"
STRING=".wav"
STR1="audiofile_"
var=0

for file in $FILES
do
    datestamp=`date '+%Y_%m_%d'`;

    STR2="_`printf %03d $var`"
    newfilename="$STR1$datestamp$STR2$STRING"

    if [[ "$file" == *"$STR1"* ]]
    then
        echo "File $file content $STR1"

    elif [[ -f $newfilename ]] 
    then
        echo "File $file alredy exist"
 
    elif [[ "$file" == *"$STRING" ]] 
    then

       	 	echo "File "$file" is now: "$newfilename
        	mv $file $newfilename
        	var=$((var+1))
    else
	echo "Nothing has changed for $file" 
    fi

done
