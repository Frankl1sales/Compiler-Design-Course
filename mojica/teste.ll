target triple = "x86_64-pc-linux-gnu"
@.str = private unnamed_addr constant [5 x i8] c"%lf\0A\00", align 1

@.str.true  = private unnamed_addr constant [6 x i8] c"True\0A\00", align 1
@.str.false = private unnamed_addr constant [7 x i8] c"False\0A\00", align 1
@.str.scanf = private unnamed_addr constant [4 x i8] c"%lf\00", align 1
declare i32 @printf(i8* noundef, ...) #1

declare double @fmod(double noundef, double noundef) #1

declare i32 @__isoc99_scanf(i8* noundef, ...) #1

define i32 @and__(i32 %0, i32 %1){
	%3 = alloca i32, align 4
	%4 = alloca i32, align 4
	store i32 %0, i32* %3, align 4
	store i32 %1, i32* %4, align 4
	%5 = load i32, i32* %3, align 4
	%6 = icmp ne i32 %5, 0
	br i1 %6, label %7, label %10
7:
	%8 = load i32, i32* %4, align 4
	%9 = icmp ne i32 %8, 0
	br label %10
10:
	%11 = phi i1 [ false, %2 ], [ %9, %7 ]
	%12 = zext i1 %11 to i32
	ret i32 %12
}

define i32 @or__(i32 %0, i32 %1){
	%3 = alloca i32, align 4
	%4 = alloca i32, align 4
	store i32 %0, i32* %3, align 4
	store i32 %1, i32* %4, align 4
	%5 = load i32, i32* %3, align 4
	%6 = icmp ne i32 %5, 0
	br i1 %6, label %10, label %7
7:
	%8 = load i32, i32* %4, align 4
	%9 = icmp ne i32 %8, 0
	br label %10
10:
	%11 = phi i1 [ true, %2 ], [ %9, %7 ]
	%12 = zext i1 %11 to i32
	ret i32 %12
}

define dso_local double @fmodf__(double %0, double %1) #0 {
	%3 = alloca double
	%4 = alloca double
	store double %0, double* %3
	store double %1, double* %4
	%5 = load double, double* %3
	%6 = load double, double* %4
	%7 = call double @fmod(double noundef %5, double noundef %6) #2
	ret double %7
}

define void @printBool__(i32 %0)  {
	%2 = alloca i32, align 4
	store i32 %0, i32* %2, align 4
	%3 = load i32, i32* %2, align 4
	%4 = icmp ne i32 %3, 0
	br i1 %4, label %5, label %7
5:
	%6 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([6 x i8], [6 x i8]* @.str.true, i64 0, i64 0))
	br label %9
7:
	%8 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([7 x i8], [7 x i8]* @.str.false, i64 0, i64 0))
	br label %9
9:
	ret void
}

define dso_local double @readFloat__() #0 {
	%1 = alloca double
%2 = call i32 (i8*, ...) @__isoc99_scanf(i8* noundef getelementptr inbounds ([4 x i8], [4 x i8]* @.str.scanf, i64 0, i64 0), double* noundef %1)
%3 = load double, double* %1
ret double %3
}

define i32 @myprint(double %n){
nentry:
	%0 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i64 0, i64 0), double noundef %n)

	ret i32 0
}

define i32 @main() {
entry:
	%x = alloca double
	store double 0.0, double* %x
	%y = alloca double
	store double 0.0, double* %y
	%0 = fmul double 3.0, 400.0
	%1 = fdiv double %0, 20.0
	%2 = fadd double 45.0, 2.0
	%3 = fsub double %1, %2
	store double %3, double* %x
	%4 = load double, double* %x
	%5 = fmul double %4, 4.9
	%6 = fadd double 156.0, %5
	%7 = fdiv double %6, 2.0
	%8 = fsub double %7, 1.0
	store double %8, double* %y
	%9 = load double, double* %x
	%10 = load double, double* %y
	%11 = fmul double %9, %10
	%12 = load double, double* %y
	%13 = load double, double* %x
	%14 = fmul double %12, %13
	%15 = fadd double %11, %14
	%16 = call i32 @myprint(double %15)
	ret i32 0
}