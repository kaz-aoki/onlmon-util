#!/bin/bash

if [ $# -lt 1 ];then
    echo $0 [filelist.txt]
    exit 1
fi

cat $1 | while read line
do
    echo $line
    ./add-runnum.sh $line
done
