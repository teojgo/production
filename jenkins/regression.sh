#!/bin/bash -l
PREFIX="$SCRATCH/$project_name/$linkname"
export EASYBUILD_TMPDIR=$PREFIX/tmp
export EASYBUILD_SOURCE_PATH=$PREFIX/sources 
status=0

if [ -d $PREFIX ]; then
    rm -rf $PREFIX/*
else 
    mkdir -p $PREFIX
fi



if [[ $ARCH == "" ]]; then
    $command $PWD/jenkins-builds/production.sh --list=$PWD/jenkins-builds/${linkname} --prefix=$PREFIX --unuse=${unuse_path}
else
    ${command/ARCH/$ARCH} $PWD/jenkins-builds/production.sh --arch=$ARCH --list=$PWD/jenkins-builds/${linkname} --prefix=${PREFIX} --unuse=${unuse_path/ARCH/$ARCH} --xalt=no
fi 
status=$[status+$?]

chmod -R o+r $EASYBUILD_TMPDIR
find $EASYBUILD_TMPDIR -type d -exec chmod o+x '{}' \;

exit ${status}
