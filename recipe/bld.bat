mkdir build
cd build

cmake -G "%CMAKE_GENERATOR%" ^
         -DCMAKE_BUILD_TYPE=Release ^
         -DCMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX% ^
         ..

cmake --build .
ctest
cmake --build . --target install
