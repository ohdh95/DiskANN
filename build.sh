mkdir build
cd build
cmake .. -DCMAKE_CXX_FLAGS="-I/usr/include/mkl"
make -j
