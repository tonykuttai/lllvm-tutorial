; ModuleID = 'input_for_cc.c'
source_filename = "input_for_cc.c"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-macosx14.0.0"

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @foo() #0 {
entry:
  ret void
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @bar() #0 {
entry:
  call void @foo()
  ret void
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @fez() #0 {
entry:
  call void @bar()
  ret void
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define i32 @main() #0 {
entry:
  %retval = alloca i32, align 4
  %ii = alloca i32, align 4
  store i32 0, ptr %retval, align 4
  call void @foo()
  call void @bar()
  call void @fez()
  store i32 0, ptr %ii, align 4
  store i32 0, ptr %ii, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, ptr %ii, align 4
  %cmp = icmp slt i32 %0, 10
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  call void @foo()
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %1 = load i32, ptr %ii, align 4
  %inc = add nsw i32 %1, 1
  store i32 %inc, ptr %ii, align 4
  br label %for.cond, !llvm.loop !5

for.end:                                          ; preds = %for.cond
  ret i32 0
}

attributes #0 = { noinline nounwind optnone ssp uwtable(sync) "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+crc,+dotprod,+fp-armv8,+fp16fml,+fullfp16,+lse,+neon,+ras,+rcpc,+rdm,+sha2,+sha3,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8.5a,+v8a,+zcm,+zcz" }

!llvm.module.flags = !{!0, !1, !2, !3}
!llvm.ident = !{!4}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"uwtable", i32 1}
!3 = !{i32 7, !"frame-pointer", i32 1}
!4 = !{!"clang version 18.0.0 (https://github.com/llvm/llvm-project.git 651c502fc8e6e1dfac4c3701e57da7bece6e637e)"}
!5 = distinct !{!5, !6}
!6 = !{!"llvm.loop.mustprogress"}
