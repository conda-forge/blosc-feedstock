setlocal EnableDelayedExpansion

mkdir build
if errorlevel 1 exit 1
cd build
if errorlevel 1 exit 1

cmake -G "NMake Makefiles" ^
      -DCMAKE_BUILD_TYPE:STRING="Release" ^
      -DCMAKE_PREFIX_PATH:PATH="%LIBRARY_PREFIX%" ^
      -DCMAKE_INSTALL_PREFIX:PATH="%LIBRARY_PREFIX%" ^
      -DCMAKE_RUNTIME_OUTPUT_DIRECTORY:PATH="%LIBRARY_BIN%" ^
      -DCMAKE_ARCHIVE_OUTPUT_DIRECTORY:PATH="%LIBRARY_LIB%" ^
      -DCMAKE_POSITION_INDEPENDENT_CODE:BOOL=ON ^
      -DBUILD_STATIC:BOOL=ON ^
      -DBUILD_SHARED:BOOL=ON ^
      -DBUILD_TESTS:BOOL=ON ^
      -DBUILD_BENCHMARKS:BOOL=OFF ^
      "%SRC_DIR%"
if errorlevel 1 exit 1

cmake --build .
if errorlevel 1 exit 1

ctest
if errorlevel 1 exit 1

cmake --build . --target install
if errorlevel 1 exit 1
