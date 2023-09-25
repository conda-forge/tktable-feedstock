#!/bin/bash

set -euxo pipefail

uname -s

./configure --prefix=${PREFIX}        \
            --with-tcl=${PREFIX}/lib  \
            --with-tk=${PREFIX}/lib

cat config.log

make -j${CPU_COUNT}
make install
