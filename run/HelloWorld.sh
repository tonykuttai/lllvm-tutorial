#!/bin/bash
curdir=$(pwd)
export LLVM_DIR=/Volumes/SamsungT5/Apps/llvm-project/build
workspaceFolder="/Volumes/SamsungT5/Learning/LLVM/llvm-tutor"
cd $workspaceFolder/inputs
$LLVM_DIR/bin/clang -O1 -S -emit-llvm  $workspaceFolder/inputs/input_for_hello.c -o input_for_hello.ll
$LLVM_DIR/bin/opt -load-pass-plugin $workspaceFolder/HelloWorld/build/libHelloWorld.dylib -passes=hello-world -disable-output input_for_hello.ll


