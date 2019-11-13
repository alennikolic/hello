#!/bin/bash


FILES="/etc/*"
STRING=".wav"
var=0

for file in $FILES
do
    datestamp=`date '+%Y_%m_%d'`;
    newfilename="audiofile_"$datestamp"_`printf %03d $var`"$STRING
    if [ ! -f $newfilename ]; then
    
        if [[ "$file" == *"$STRING" ]]; then

        echo "File "$file" is now: "$newfilename;
        # mv $file $newfilename
        var=$((var+1))
        fi
    fi
done
