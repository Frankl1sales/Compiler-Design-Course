; ModuleID = '<stdin>'
source_filename = "arith.ll"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [5 x i8] c"%lf\0A\00", align 1
@.str.true = private unnamed_addr constant [6 x i8] c"True\0A\00", align 1
@.str.false = private unnamed_addr constant [7 x i8] c"False\0A\00", align 1
@.str.scanf = private unnamed_addr constant [4 x i8] c"%lf\00", align 1

declare i32 @printf(i8* noundef, ...)

declare double @fmod(double noundef, double noundef)

declare i32 @__isoc99_scanf(i8* noundef, ...)

define i32 @and__(i32 %0, i32 %1) {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 %0, i32* %3, align 4
  store i32 %1, i32* %4, align 4
  %5 = load i32, i32* %3, align 4
  %6 = icmp ne i32 %5, 0
  br i1 %6, label %7, label %10

7:                                                ; preds = %2
  %8 = load i32, i32* %4, align 4
  %9 = icmp ne i32 %8, 0
  br label %10

10:                                               ; preds = %7, %2
  %11 = phi i1 [ false, %2 ], [ %9, %7 ]
  %12 = zext i1 %11 to i32
  ret i32 %12
}

define i32 @or__(i32 %0, i32 %1) {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 %0, i32* %3, align 4
  store i32 %1, i32* %4, align 4
  %5 = load i32, i32* %3, align 4
  %6 = icmp ne i32 %5, 0
  br i1 %6, label %10, label %7

7:                                                ; preds = %2
  %8 = load i32, i32* %4, align 4
  %9 = icmp ne i32 %8, 0
  br label %10

10:                                               ; preds = %7, %2
  %11 = phi i1 [ true, %2 ], [ %9, %7 ]
  %12 = zext i1 %11 to i32
  ret i32 %12
}

define dso_local double @fmodf__(double %0, double %1) {
  %3 = alloca double, align 8
  %4 = alloca double, align 8
  store double %0, double* %3, align 8
  store double %1, double* %4, align 8
  %5 = load double, double* %3, align 8
  %6 = load double, double* %4, align 8
  %7 = call double @fmod(double noundef %5, double noundef %6)
  ret double %7
}

define void @printBool__(i32 %0) {
  %2 = alloca i32, align 4
  store i32 %0, i32* %2, align 4
  %3 = load i32, i32* %2, align 4
  %4 = icmp ne i32 %3, 0
  br i1 %4, label %5, label %7

5:                                                ; preds = %1
  %6 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([6 x i8], [6 x i8]* @.str.true, i64 0, i64 0))
  br label %9

7:                                                ; preds = %1
  %8 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([7 x i8], [7 x i8]* @.str.false, i64 0, i64 0))
  br label %9

9:                                                ; preds = %7, %5
  ret void
}

define dso_local double @readFloat__() {
  %1 = alloca double, align 8
  %2 = call i32 (i8*, ...) @__isoc99_scanf(i8* noundef getelementptr inbounds ([4 x i8], [4 x i8]* @.str.scanf, i64 0, i64 0), double* noundef %1)
  %3 = load double, double* %1, align 8
  ret double %3
}

define i32 @myprint(double %n) {
nentry:
  %0 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i64 0, i64 0), double noundef %n)
  ret i32 0
}

define i32 @main() {
entry:
  %x = alloca double, align 8
  store double 0.000000e+00, double* %x, align 8
  %y = alloca double, align 8
  store double 0.000000e+00, double* %y, align 8
  store double 1.300000e+01, double* %x, align 8
  %0 = load double, double* %x, align 8
  %1 = fmul double %0, 4.900000e+00
  %2 = fadd double 1.560000e+02, %1
  %3 = fdiv double %2, 2.000000e+00
  %4 = fsub double %3, 1.000000e+00
  store double %4, double* %y, align 8
  %5 = load double, double* %x, align 8
  %6 = load double, double* %y, align 8
  %7 = fmul double %5, %6
  %8 = load double, double* %y, align 8
  %9 = load double, double* %x, align 8
  %10 = fmul double %8, %9
  %11 = fadd double %7, %10
  %12 = call i32 @myprint(double %11)
  ret i32 0
}
