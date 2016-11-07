#!/bin/bash

mkdir build
cd build

cmake -DCMAKE_INSTALL_PREFIX=$PREFIX ..

cmake --build .
ctest
cmake --build . --target install
