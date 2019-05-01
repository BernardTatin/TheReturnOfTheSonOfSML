#!/bin/sh 

docdir=./fulldoc

rm -rf $docdir

for f in $(find . -name '*.md')
do
    echo "$f ...."
    fdir=$(dirname $f)
    fname=$(basename $f .md)
    ddir=$(echo $fdir | sed "s!^\.!${docdir}!")
    echo "$f -> $ddir/$fname.pdf"
    mkdir -p $ddir 
    # cp --verbose $f $ddir
    # pandoc -f markdown -t html $f -o $ddir/$fname.pdf
    # pandoc --standalone --css $(pwd)/style.css -f markdown -t html $f -o $ddir/$fname.html
    pandoc --standalone --css $(pwd)/style.css -f markdown -t html $f -o $ddir/$fname.pdf
done
