#!/bin/bash

mkdir build
cd build

cmake \
       -DCMAKE_BUILD_TYPE="Release" \
       -DCMAKE_INSTALL_PREFIX=$PREFIX \
       ..

cmake --build .
ctest
cmake --build . --target install
