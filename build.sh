cd build
export LLVM_DIR=/Volumes/SamsungT5/Apps/llvm-project/build
cmake -DCMAKE_BUILD_TYPE=Debug -DLT_LLVM_INSTALL_DIR=$LLVM_DIR ../
make
cd ..