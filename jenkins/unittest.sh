#!/bin/bash -l
PREFIX="$SCRATCH/${project_name}"
EASYBUILD_TMPDIR=${PREFIX}/tmp
EASYBUILD_SOURCE_PATH=${PREFIX}/sources 
status=0

if [ -d $PREFIX ]; then
    rm -rf $PREFIX/*
else 
    mkdir $PREFIX
fi

offlist="a/Amber c/CPMD n/NAMD n/NCL u/UDUNITS v/VASP v/Visit"
pushd $HOME
for item in ${offlist}; do 
    cp --parents -r sources/$item $PREFIX
done
popd 
      
# --- BUILD ---
if [[ "$system" =~ "daint" || "$system" =~ "dom" ]]; then
    for ARCH in ${arch_list}; do
        linkname="${system}-${ARCH}"
        ${command/ARCH/$ARCH} $PWD/jenkins-builds/production.sh --arch=$ARCH --list=$PWD/jenkins-builds/${linkname} --prefix=${PREFIX}/${ARCH} --unuse=${unuse_path/ARCH/$ARCH} --xalt=no
        status=$[status+$?]
        echo $linkname
    done
else
    linkname=${system}
    $command $PWD/jenkins-builds/production.sh --list=$PWD/jenkins-builds/${linkname} --prefix=$PREFIX --unuse=${unuse_path}
    status=$[status+$?]
    echo $linkname
fi 
exit ${status}

