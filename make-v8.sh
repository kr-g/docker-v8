#!/bin/bash

export BDIR=${1:-~} && if [ ! -d $BDIR ]; then echo [fail] $BDIR does not exist; exit 1; fi
export CHECKOUT=${CHKOUT:-master}
export ARCH=${ARCH:-x64.release}
export NCPU=${NCPU:-`cat /proc/cpuinfo | grep processor | wc -l`}

cd $BDIR/repo/

export PATH=`pwd`/depot_tools:"$PATH"
gclient sync

cd v8

git checkout $CHECKOUT

# build static shared lib with no external snapshot
make $ARCH -j $NCPU library=shared snapshot=off

ldconfig $BDIR/repo/v8/out/$ARCH/lib.target/

# update static lib tar
tar -cf /libv8-static-$ARCH.tar $BDIR/repo/v8/out/$ARCH/lib.target/*.so



