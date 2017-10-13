#!/bin/bash -l
export EASYBUILD_TMPDIR=$PREFIX/tmp
export EASYBUILD_SOURCEPATH=$PREFIX/sources 
status=0

if [ -d $PREFIX ]; then
    rm -rf $PREFIX/*
else 
    mkdir -p $PREFIX
fi

$command

status=$[status+$?]

chmod -R o+r $EASYBUILD_TMPDIR
find $EASYBUILD_TMPDIR -type d -exec chmod o+x '{}' \;

exit ${status}
