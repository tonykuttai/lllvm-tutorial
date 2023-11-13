#!/bin/bash
curdir=$(pwd)
LLVM_DIR=/Volumes/SamsungT5/Apps/llvm-project/build
workspaceFolder="/Volumes/SamsungT5/Learning/LLVM/llvm-tutor"
cd $workspaceFolder/inputs

$LLVM_DIR/bin/clang -emit-llvm -S -O0 input_for_cc.c -o input_for_cc.ll
lldb -- $LLVM_DIR/bin/opt -S -load-pass-plugin $workspaceFolder/build/lib/libOpcodeCounter.dylib --passes="print<opcode-counter>" input_for_cc.ll -o out.ll
cd $curdir
