#!/bin/bash
curdir=$(pwd)
export LLVM_DIR=/Volumes/SamsungT5/Apps/llvm-project/build
workspaceFolder="/Volumes/SamsungT5/Learning/LLVM/llvm-tutor"
cd $workspaceFolder/inputs
# Generate an LLVM file to analyze
$LLVM_DIR/bin/clang -g -emit-llvm -c input_for_cc.c -o input_for_cc.bc
# Run the pass through opt
$LLVM_DIR/bin/opt -load-pass-plugin $workspaceFolder/build/lib/libOpcodeCounter.dylib --passes="print<opcode-counter>" -disable-output input_for_cc.bc
cd $curdir