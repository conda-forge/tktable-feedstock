#!/bin/bash

set -euxo pipefail

./configure --prefix=${PREFIX}        \
            --with-tcl=${PREFIX}/lib  \
            --with-tk=${PREFIX}/lib

make -j${CPU_COUNT}
make install
