#!/bin/bash

if [ $# -lt 1 ];then
    echo $0 [filename.png]
    echo "Use add-runnum-loop.sh to apply this for multiple files"
    exit 1
fi

filename=$1
run=`echo $filename | grep -oP '_run\K[0-9]+'`

res=`identify $filename | awk '{print $3}'`
echo $res
echo $run
filebase="${filename%.*}"
echo $filebase

convert -font Helvetica -size $res \
	-fill "#000000" \
	-background none \
	-pointsize 80 \
	caption:"run${run}" \
	tmp/textImage.png

composite -compose over \
	  tmp/textImage.png \
	  $1 \
	  $filebase-run.png




		       
