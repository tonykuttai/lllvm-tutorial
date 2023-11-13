LLVM_DIR=/Volumes/SamsungT5/Apps/llvm-project/build
workspaceFolder="/Volumes/SamsungT5/Learning/LLVM/llvm-tutor"
mkdir build
cd build
cmake -DLT_LLVM_INSTALL_DIR=$LLVM_DIR $workspaceFolder/HelloWorld/
make
cd ..