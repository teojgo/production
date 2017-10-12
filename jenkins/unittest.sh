#!/bin/bash -l
PREFIX="$SCRATCH/${project_name}"
EASYBUILD_TMPDIR=${PREFIX}/tmp
EASYBUILD_SOURCE_PATH=${PREFIX}/sources 
status=0

#if [ -d $PREFIX ]; then
#    rm -rf $PREFIX/*
#else 
#    mkdir $PREFIX
#fi

#offlist="a/Amber c/CPMD n/NAMD n/NCL u/UDUNITS v/VASP v/Visit"
#pushd $HOME
#for item in ${offlist}; do 
#    cp --parents -r sources/$item $PREFIX
#done
#popd 
      
if [[ $ACRCH=="" ]]; then
    #$command $PWD/jenkins-builds/production.sh --list=$PWD/jenkins-builds/${linkname} --prefix=$PREFIX --unuse=${unuse_path}
    echo "Hello from first if branch" 
else
#    ${command/ARCH/$ARCH} $PWD/jenkins-builds/production.sh --arch=$ARCH --list=$PWD/jenkins-builds/${linkname} --prefix=${PREFIX}/${ARCH} --unuse=${unuse_path/ARCH/$ARCH} --xalt=no
    echo "Hello from second if branch"
fi 
status=$[status+$?]
exit ${status}
