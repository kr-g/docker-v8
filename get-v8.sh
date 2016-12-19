#!/bin/bash

export BDIR=${1:-~} && if [ ! -d $BDIR ]; then echo [fail] $BDIR does not exist; exit 1; fi

mkdir -p $BDIR/repo && cd $_


git clone https://chromium.googlesource.com/chromium/tools/depot_tools.git


export PATH=`pwd`/depot_tools:"$PATH"


fetch v8

# call gclient as below to update the sources after the initial fetch

# gclient sync



