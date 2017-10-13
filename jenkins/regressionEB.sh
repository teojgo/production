#!/bin/bash -l
PREFIX="$SCRATCH/${project_name}"
export EASYBUILD_TMPDIR=$PREFIX/tmp
export EASYBUILD_SOURCE_PATH=$PREFIX/sources 
status=0

if [ -d $PREFIX ]; then
    rm -rf $PREFIX/*
else 
    mkdir -p $PREFIX
fi

if [[ "$system" =~ "daint" ]]; then
    command="srun -u --constraint=ARCH --job-name=${project_name} --time=24:00:00"
     unuse_path="$APPS/UES/jenkins/6.0.UP04/ARCH/easybuild/modules/all"
elif [[ "$system" =~ "dom" ]]; then
    command="srun -u --constraint=ARCH --job-name=${project_name} --time=24:00:00"
     unuse_path="$APPS/UES/jenkins/6.0.UP04/ARCH/easybuild/modules/all"
elif [[ "$system" =~ "kesch" ]]; then
     command=""
     unuse_path="/apps/escha/UES/generic/modulefiles:/apps/escha/UES/PrgEnv-gnu-17.02/modulefiles:/apps/escha/UES/PrgEnv-cray-17.06/modulefiles:/apps/escha/UES/experimental/modulefiles"
elif [[ "$system" =~ "leone" ]]; then
     command=""
     unuse_path="$APPS/UES/PrgEnv-gnu-2016b"
elif [[ "$system" =~ "monch" ]]; then
     command=""
     unuse_path="$APPS/UES/jenkins/RH6.9-17.06/easybuild/modules/all/"
fi

if [[ $ARCH == "" ]]; then
    $command $PWD/jenkins-builds/production.sh --list=$PWD/jenkins-builds/${linkname} --prefix=$PREFIX --unuse=${unuse_path}
else
    ${command/ARCH/$ARCH} $PWD/jenkins-builds/production.sh --arch=$ARCH --list=$PWD/jenkins-builds/${linkname} --prefix=${PREFIX}/${ARCH} --unuse=${unuse_path/ARCH/$ARCH} --xalt=no
fi 
status=$[status+$?]

chmod -R o+r $EASYBUILD_TMPDIR
find $EASYBUILD_TMPDIR -type d -exec chmod o+x '{}' \;

exit ${status}
