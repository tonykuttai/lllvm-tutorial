#!/bin/bash
curdir=$(pwd)
export LLVM_DIR=/Volumes/SamsungT5/Apps/llvm-project/build
workspaceFolder="/Volumes/SamsungT5/Learning/LLVM/llvm-tutor"
cd $workspaceFolder/inputs
# Generate an LLVM file to analyze
$LLVM_DIR/bin/clang -g -O0 -emit-llvm -c input_for_hello.c -o input_for_hello.bc
# Run the pass through opt
$LLVM_DIR/bin/opt -load-pass-plugin $workspaceFolder/build/lib/libInjectFuncCall.dylib --passes="inject-func-call" input_for_hello.bc -o instrumented.bin
$LLVM_DIR/bin/lli instrumented.bin
cd $curdir