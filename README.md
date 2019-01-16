# intel-intrinsics

[![Travis Status](https://travis-ci.org/AuburnSounds/intel-intrinsics.svg?branch=master)](https://travis-ci.org/AuburnSounds/intel-intrinsics)

The practical D SIMD solution. Use Intel intrinsics in D code with a [wide range of compilers](https://github.com/AuburnSounds/intel-intrinsics/blob/master/.travis.yml).

**This is a work in progress, please complain in the bugtracker.**

## Usage

```d


import inteli.xmmintrin; // allows SSE1 intrinsics in both DMD and LDC
import inteli.emmintrin; // allows SSE2 intrinsics in both DMD and LDC

// distance between two points in 4D
float distance(float[4] a, float[4] b) nothrow @nogc
{
    __m128 va = _mm_loadu_ps(a.ptr);
    __m128 vb = _mm_loadu_ps(b.ptr);
    __m128 diffSquared = _mm_sub_ps(va, vb);
    diffSquared = _mm_mul_ps(diffSquared, diffSquared);
    __m128 sum = _mm_add_ps(diffSquared, _mm_srli_ps!8(diffSquared));
    sum = _mm_add_ps(sum, _mm_srli_ps!4(sum));
    return _mm_cvtss_f32(_mm_sqrt_ss(sum));
}
assert(distance([0, 2, 0, 0], [0, 0, 0, 0]) == 2);


```

## Why?

### Capabilities

Some instructions aren't accessible using `core.simd` and `ldc.simd` capabilities.
For example: `pmaddwd` which is so important in digital video.

### Familiar syntax

Why Intel intrinsic syntax? Because it is more familiar to C++ programmers
and there is a convenient online guide provided by Intel:
https://software.intel.com/sites/landingpage/IntrinsicsGuide/

Without this critical Intel documentation, it's much more difficult to write SIMD code.

### Future-proof

`intel-intrinsics` is a set of stable SIMD intrinsic that the LDC team doesn't have the manpower to maintain.
It is mimicked on the set of similar intrinsics in GCC, clang, ICC...

LDC SIMD intrinsics are a moving target (https://github.com/ldc-developers/ldc/issues/2019),
and you need a layer over it if you want to be sure your code won't break.

Because those x86 intrinsics are internally converted to IR, **they often don't tie to a particular architecture**.
So you could target ARM one day and still get comparable speed-up.



### Portability

The short-term goal is:

**Write the same SIMD code for LDC GDC and DMD. Support x86 well, and ARM eventually.**. 
This is intended to be the most practical SIMD solution for D.
Including an emulation layer for DMD 32-bit which doesn't have any SIMD capability on Windows.


### Supported instructions set

- SSE1
- SSE2

The lack of AVX intrinsics is explained by the sheer amount of **work** needed to implement those SIMD intrinsics for all compilers.

### Important difference

When using the LDC compatibility layer (ie. when not using LDC), every implicit conversion of similarly-sized vectors
should be done with a `cast` instead.

```d
__m128i b = _mm_set1_epi32(42);
__m128 a = b;             // NO, only works in LDC
__m128 a = cast(__m128)b; // YES, works in all D compilers

```

This is because D does not allow user-defined implicit conversions, except magically in the compiler for real vector types.


## Who is using it?

- Pixel Perfect Engine is using `intel-intrinsics` for blitting images: https://github.com/ZILtoid1991/CPUblit/blob/master/src/CPUblit/composing.d
- Dplug is using `intel-intrinsics` for biquad processing for a 10% speed gain over equivalent assembly: https://github.com/AuburnSounds/Dplug/blob/master/dsp/dplug/dsp/iir.d#L104
- Please get in touch if you use it!