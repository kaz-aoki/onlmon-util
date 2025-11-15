#!/bin/bash

if [ $# -lt 1 ]; then
    echo $0 [filelist.txt]
    exit 1
fi


cat $1 | while read line
do
    echo $line
    tmp=`basename $line .pdf`
    echo $tmp
    pdftoppm -r 300 -cropbox -png $line png/org/$tmp
    ls png/org/${tmp}-*.png > tmp/tmp.txt
    ./add-runnum-loop.sh tmp/tmp.txt
done

#pdftoppm -r 300 -png geri_onlmon_sts02_run070400.pdf png/geri_onlmon_sts02_run070400
