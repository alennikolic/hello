#!/bin/bash

FILES="/etc/*"
STRING=".wav"
var=0

for file in $FILES
do
	datestamp=$(stat -c %y $file)
	datestamp=${datestamp%% *}


    newfilename="audiofile_"$datestamp"_`printf %03d $var`"$STRING
    if [ ! -f $newfilename ]; then
    
        if [[ "$file" == *"$STRING" ]]; then

       	 	echo "File "$file" is now: "$newfilename;
        	mv $file $newfilename
        	var=$((var+1))
        fi
    fi
done
