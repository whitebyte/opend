// Tests in-place construction of variables.

// RUN: %ldc -c -output-ll -of=%t.ll %s && FileCheck %s < %t.ll

// 256 bits, returned via sret:
struct S
{
    long a, b, c, d;
    /*
    this(this) {}
    ~this() {}
    */
}

S returnLiteral()
{
    return S(1, 2, 3, 4);
}

S returnRValue()
{
    return returnLiteral();
}

S returnNRVO()
{
    const S r;
    return r;
}

// CHECK-LABEL: define{{.*}} @{{.*}}_D18in_place_construct7structsFZv
void structs()
{
    // CHECK: %literal = alloca %in_place_construct.S
    // CHECK: %a = alloca %in_place_construct.S
    // CHECK: %b = alloca %in_place_construct.S
    // CHECK: %c = alloca %in_place_construct.S

    // make sure the literal is emitted directly into the lvalue
    // CHECK: %1 = getelementptr inbounds {{.*}}%in_place_construct.S* %literal, i32 0, i32 0
    // CHECK: store i64 5, i64* %1
    // CHECK: %2 = getelementptr inbounds {{.*}}%in_place_construct.S* %literal, i32 0, i32 1
    // CHECK: store i64 6, i64* %2
    // CHECK: %3 = getelementptr inbounds {{.*}}%in_place_construct.S* %literal, i32 0, i32 2
    // CHECK: store i64 7, i64* %3
    // CHECK: %4 = getelementptr inbounds {{.*}}%in_place_construct.S* %literal, i32 0, i32 3
    // CHECK: store i64 8, i64* %4
    const literal = S(5, 6, 7, 8);

    // make sure the variables are in-place constructed via sret
    // CHECK: call {{.*}}_D18in_place_construct13returnLiteralFZS18in_place_construct1S
    // CHECK-SAME: %in_place_construct.S* {{.*}} %a
    const a = returnLiteral();
    // CHECK: call {{.*}}_D18in_place_construct12returnRValueFZS18in_place_construct1S
    // CHECK-SAME: %in_place_construct.S* {{.*}} %b
    const b = returnRValue();
    // CHECK: call {{.*}}_D18in_place_construct10returnNRVOFZS18in_place_construct1S
    // CHECK-SAME: %in_place_construct.S* {{.*}} %c
    const c = returnNRVO();
}

// CHECK-LABEL: define{{.*}} @{{.*}}_D18in_place_construct12staticArraysFZv
void staticArrays()
{
    // CHECK: %sa = alloca [2 x i32]

    // make sure static array literals are in-place constructed too
    // CHECK: store [2 x i32] [i32 1, i32 2], [2 x i32]* %sa
    const(int[2]) sa = [ 1, 2 ];
}

// CHECK-LABEL: define{{.*}} @{{.*}}_Dmain
void main()
{
    structs();
    staticArrays();
}
