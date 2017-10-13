#!/bin/bash -l

# exit status
status=0

EASYBUILD_TMPDIR=$PREFIX/tmp
EASYBUILD_SOURCEPATH=$PREFIX/sources
EB_CUSTOM_REPOSITORY=$WORKING_DIR/easybuild

# --- BUILD LIST ---
# http://stackoverflow.com/questions/6879501/filter-git-diff-by-type-of-change
buildlist=$(git diff origin/master..HEAD --name-only --oneline --no-merges --diff-filter=ACMRTUXB |grep ^easybuild.*\.eb\$ |awk '{print "basename "$0}'|sh)
echo -e "\n Current diff list by 'git diff origin/master..HEAD --name-only --oneline --no-merges --diff-filter=ACMRTUXB':"
git diff origin/master..HEAD --name-only --oneline --no-merges --diff-filter=ACMRTUXB

if [ -z "$buildlist" ]; then
    echo -e "\n No EasyBuild recipe to build, skipping build \n"
    exit 0
else
    echo $buildlist | tr " " "\n" > "$PWD/${project_name}.txt"
fi


# clean PREFIX folder
if [ -d $PREFIX ]; then
    rm -rf $PREFIX/*
fi

$COMMAND

status=$[status+$?]

# makes TMPDIR files readable to others
chmod -R o+r $EASYBUILD_TMPDIR
find $EASYBUILD_TMPDIR -type d -exec chmod o+x '{}' \;

# return exit status of the call to the production script
exit $[status]
