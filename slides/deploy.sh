#!/bin/sh

if [ -d $1 ] ; then
    if [ ! -e public/$1 ] ; then
        mkdir public/$1
    fi
    pandoc --template template.html -s -i -t revealjs -p \
        --slide-level=2 --highlight-style=espresso \
        -V theme=black -V history \
        -V revealjs-url=//cdnjs.cloudflare.com/ajax/libs/reveal.js/3.3.0 \
        $1/index.md -o public/$1/index.html
    if [ -d $1/res ] ; then
        rsync -a --delete $1/res public/$1
    fi
    rsync -a --delete public/$1 ../../coursesite/static/vi-course
fi
