#!/bin/bash

FILES="/etc/*"
STRING=".wav"
var=0

for file in $FILES
do
    datestamp=$(stat -c %y $file)
    datestamp=${datestamp%% *}

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
