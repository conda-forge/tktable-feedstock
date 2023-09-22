#!/bin/bash

./configure --prefix=${PREFIX}        \
            --with-tcl=${PREFIX}/lib  \
            --with-tk=${PREFIX}/lib
[[ "$target_platform" == "win-64" ]] && patch_libtool
make -j${CPU_COUNT} ${VERBOSE_AT}
make install
