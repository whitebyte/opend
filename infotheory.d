/**Basic information theory.  Joint entropy, mutual information, conditional
 * mutual information.  This module uses the base 2 definition of these
 * quantities, i.e, entropy, mutual info, etc. are output in bits.
 *
 * Author:  David Simcha*/
 /*
 * License:
 * Boost Software License - Version 1.0 - August 17th, 2003
 *
 * Permission is hereby granted, free of charge, to any person or organization
 * obtaining a copy of the software and accompanying documentation covered by
 * this license (the "Software") to use, reproduce, display, distribute,
 * execute, and transmit the Software, and to prepare derivative works of the
 * Software, and to permit third-parties to whom the Software is furnished to
 * do so, all subject to the following:
 *
 * The copyright notices in the Software and this entire statement, including
 * the above license grant, this restriction and the following disclaimer,
 * must be included in all copies of the Software, in whole or in part, and
 * all derivative works of the Software, unless such copies or derivative
 * works are solely in the form of machine-executable object code generated by
 * a source language processor.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE, TITLE AND NON-INFRINGEMENT. IN NO EVENT
 * SHALL THE COPYRIGHT HOLDERS OR ANYONE DISTRIBUTING THE SOFTWARE BE LIABLE
 * FOR ANY DAMAGES OR OTHER LIABILITY, WHETHER IN CONTRACT, TORT OR OTHERWISE,
 * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
 * DEALINGS IN THE SOFTWARE.
 */

module dstats.infotheory;

import std.traits, std.math, std.typetuple, std.functional, std.range,
       std.array, std.typecons;

import dstats.sort, dstats.summary, dstats.base, dstats.alloc;

version(unittest) {
    import std.stdio, std.bigint, std.algorithm : map;

    void main() {}
}

/**This function calculates the Shannon entropy of a forward range that is
 * treated as frequency counts of a set of discrete observations.
 *
 * Examples:
 * ---
 * real uniform3 = entropyCounts([4, 4, 4]);
 * assert(approxEqual(uniform3, log2(3)));
 * real uniform4 = entropyCounts([5, 5, 5, 5]);
 * assert(approxEqual(uniform4, 2));
 * ---
 */
real entropyCounts(T)(T data)
if(isForwardRange!(T)) {
    auto save = data;
    return entropyCounts(save, sum!(T, real)(data));
}

real entropyCounts(T)(T data, real n)
if(isIterable!(T)) {
    real nNeg1 = 1.0L / n;
    real entropy = 0;
    foreach(value; data) {
        if(value == 0)
            continue;
        real pxi = cast(real) value * nNeg1;
        entropy -= pxi * log2(pxi);
    }
    return entropy;
}

unittest {
    real uniform3 = entropyCounts([4, 4, 4].dup);
    assert(approxEqual(uniform3, log2(3)));
    real uniform4 = entropyCounts([5, 5, 5, 5].dup);
    assert(approxEqual(uniform4, 2));
    assert(entropyCounts([2,2].dup)==1);
    assert(entropyCounts([5.1,5.1,5.1,5.1].dup)==2);
    assert(approxEqual(entropyCounts([1,2,3,4,5].dup), 2.1492553971685));
    writefln("Passed entropyCounts unittest.");
}

template FlattenType(T...) {
    alias FlattenTypeImpl!(T).ret FlattenType;
}

template FlattenTypeImpl(T...) {
    static if(T.length == 0) {
        alias TypeTuple!() ret;
    } else {
        T[0] j;
        static if(is(typeof(j._jointRanges))) {
            alias TypeTuple!(typeof(j._jointRanges), FlattenType!(T[1..$])) ret;
        } else {
            alias TypeTuple!(T[0], FlattenType!(T[1..$])) ret;
        }
    }
}

private Joint!(FlattenType!(T, U)) flattenImpl(T, U...)(T start, U rest) {
    static if(rest.length == 0) {
        return start;
    } else static if(is(typeof(rest[0]._jointRanges))) {
        return flattenImpl(jointImpl(start.tupleof, rest[0]._jointRanges), rest[1..$]);
    } else {
        return flattenImpl(jointImpl(start.tupleof, rest[0]), rest[1..$]);
    }
}

Joint!(FlattenType!(T)) flatten(T...)(T args) {
    static assert(args.length > 0);
    static if(is(typeof(args[0]._jointRanges))) {
        auto myTuple = args[0];
    } else {
        auto myTuple = jointImpl(args[0]);
    }
    static if(args.length == 1) {
        return myTuple;
    } else {
        return flattenImpl(myTuple, args[1..$]);
    }
}

/**Bind a set of ranges together to represent a joint probability distribution.
 *
 * Examples:
 * ---
 * auto foo = [1,2,3,1,1];
 * auto bar = [2,4,6,2,2];
 * auto e = entropy(joint(foo, bar));  // Calculate joint entropy of foo, bar.
 * ---
 */
Joint!(FlattenType!(T)) joint(T...)(T args) {
    return jointImpl(flatten(args).tupleof);
}

Joint!(T) jointImpl(T...)(T args) {
    return Joint!(T)(args);
}

/**Iterate over a set of ranges in lockstep and return an ObsEnt,
 * which is used internally by entropy functions on each iteration.*/
struct Joint(T...) {
    T _jointRanges;

    auto front() {
        alias ElementsTuple!(T) E;
        alias ObsEnt!(E) rt;
        rt ret;
        foreach(ti, elem; _jointRanges) {
            ret.tupleof[ti] = elem.front;
        }
        return ret;
    }

    void popFront() {
        foreach(ti, elem; _jointRanges) {
            _jointRanges[ti].popFront;
        }
    }

    bool empty() {
        foreach(elem; _jointRanges) {
            if(elem.empty) {
                return true;
            }
        }
        return false;
    }

    static if(T.length > 0 && allSatisfy!(dstats.base.hasLength, T)) {
        uint length() {
            uint ret = uint.max;
            foreach(range; _jointRanges) {
                auto len = range.length;
                if(len < ret) {
                    ret = len;
                }
            }
            return ret;
        }
    }
}

template ElementsTuple(T...) {
    static if(T.length == 1) {
        alias TypeTuple!(Unqual!(ElementType!(T[0]))) ElementsTuple;
    } else {
        alias TypeTuple!(Unqual!(ElementType!(T[0])), ElementsTuple!(T[1..$]))
            ElementsTuple;
    }
}

private template Comparable(T) {
    enum bool Comparable = is(typeof({
        T a;
        T b;
        return a < b; }));
}

struct ObsEnt(T...) {
    T compRep;

    hash_t toHash() {
        hash_t sum = 0;
        foreach(i, elem; this.tupleof) {
            static if(is(elem : long) && elem.sizeof <= hash_t.sizeof) {
                sum += elem << i;
            } else static if(__traits(compiles, elem.toHash)) {
                sum += elem.toHash << i;
            } else {
                auto ti = typeid(typeof(elem));
                sum += ti.getHash(&elem) << i;
            }
        }
        return sum;
    }

    bool opEquals(ref typeof(this) rhs) {
        foreach(ti, elem; this.tupleof) {
            if(elem != rhs.tupleof[ti])
                return false;
        }
        return true;
    }

    static if(allSatisfy!(Comparable, T)) {
        int opCmp(ref typeof(this) rhs) {
            foreach(ti, elem; this.tupleof) {
                if(rhs.tupleof[ti] < elem) {
                    return -1;
                } else if(rhs.tupleof[ti] > elem) {
                    return 1;
                }
            }
            return 0;
        }
    }

}

// Whether we can use StackHash, or whether we have to use a regular AA for
// entropy.
private template NeedsHeap(T) {
    static if(!isReferenceType!(IterType!(T))) {
        enum bool NeedsHeap = false;
    } else static if(isArray!(T)) {
        enum bool NeedsHeap = false;
    } else static if(is(T == Joint!(typeof(T.init.tupleof)))
           && allSatisfy!(isArray, typeof(T.init.tupleof))) {
        enum bool NeedsHeap = false;
    } else {
        enum bool NeedsHeap = true;
    }
}

unittest {
    auto foo = map!("a.dup")(cast(uint[][]) [[1]]);
    auto bar = map!("a + 2")(cast(uint[]) [1,2,3]);
    static assert(NeedsHeap!(typeof(foo)));
    static assert(!NeedsHeap!(typeof(bar)));
    static assert(NeedsHeap!(Joint!(uint[], typeof(foo))));
    static assert(!NeedsHeap!(Joint!(uint[], typeof(bar))));
    static assert(!NeedsHeap!(Joint!(uint[], uint[])));
}

/**Calculates the joint entropy of a set of observations.  Each input range
 * represents a vector of observations. If only one range is given, this reduces
 * to the plain old entropy.  Input range must have a length.
 *
 * Note:  This function specializes if ElementType!(T) is a byte, ubyte, or
 * char, resulting in a much faster entropy calculation.  When possible, try
 * to provide data in the form of a byte, ubyte, or char.
 *
 * Examples:
 * ---
 * int[] foo = [1, 1, 1, 2, 2, 2, 3, 3, 3];
 * real entropyFoo = entropy(foo);  // Plain old entropy of foo.
 * assert(approxEqual(entropyFoo, log2(3)));
 * int[] bar = [1, 2, 3, 1, 2, 3, 1, 2, 3];
 * real HFooBar = entropy(joint(foo, bar));  // Joint entropy of foo and bar.
 * assert(approxEqual(HFooBar, log2(9)));
 * ---
 */
real entropy(T)(T data)
if(isIterable!(T)) {
    static if(!dstats.base.hasLength!(T)) {
        return entropyImpl!(uint, T)(data);
    } else {
        if(data.length <= ubyte.max) {
            return entropyImpl!(ubyte, T)(data);
        } else if(data.length <= ushort.max) {
            return entropyImpl!(ushort, T)(data);
        } else {
            return entropyImpl!(uint, T)(data);
        }
    }
}

private real entropyImpl(U, T)(T data)
if(IterType!(T).sizeof > 1 && !NeedsHeap!(T)) {  // Generic version.
    alias IterType!(T) E;

    TempAlloc.frameInit;
    alias StackHash!(E, U) mySh;
    uint len = 0;  // In case length calculation is expensive.
    mySh counts = mySh(len / 5);

    foreach(elem; data)  {
        len++;
        counts[elem]++;
    }

    real ans = entropyCounts(counts.values, len);
    TempAlloc.frameFree;
    return ans;
}

private real entropyImpl(U, T)(T data)
if(IterType!(T).sizeof > 1 && NeedsHeap!(T)) {  // Generic version.
    alias IterType!(T) E;

    uint len = 0;
    U[E] counts;
    foreach(elem; data) {
        len++;
        counts[elem]++;
    }
    return entropyCounts(counts, len);
}

private real entropyImpl(U, T)(T data)  // byte/char specialization
if(IterType!(T).sizeof == 1) {
    alias IterType!(T) E;

    U[ubyte.max + 1] counts;

    uint min = ubyte.max, max = 0, len = 0;
    foreach(elem; data)  {
        len++;
        static if(is(E == byte)) {
            // Keep adjacent elements adjacent.  In real world use cases,
            // probably will have ranges like [-1, 1].
            ubyte e = cast(ubyte) (cast(ubyte) (elem) + byte.max);
        } else {
            ubyte e = cast(ubyte) elem;
        }
        counts[e]++;
        if(e > max) {
            max = e;
        }
        if(e < min) {
            min = e;
        }
    }

    return entropyCounts(counts.ptr[min..max + 1], len);
}

unittest {
    { // Generic version.
        int[] foo = [1, 1, 1, 2, 2, 2, 3, 3, 3];
        real entropyFoo = entropy(foo);
        assert(approxEqual(entropyFoo, log2(3)));
        int[] bar = [1, 2, 3, 1, 2, 3, 1, 2, 3];
        auto stuff = joint(foo, bar);
        real jointEntropyFooBar = entropy(joint(foo, bar));
        assert(approxEqual(jointEntropyFooBar, log2(9)));
    }
    { // byte specialization
        byte[] foo = [-1, -1, -1, 2, 2, 2, 3, 3, 3];
        real entropyFoo = entropy(foo);
        assert(approxEqual(entropyFoo, log2(3)));
        string bar = "ACTGGCTA";
        assert(entropy(bar) == 2);
    }
    { // NeedsHeap version.
        string[] arr = ["1", "1", "1", "2", "2", "2", "3", "3", "3"];
        auto m = map!("a")(arr);
        assert(approxEqual(entropy(m), log2(3)));
    }
    writeln("Passed entropy unittest.");
}

/**Calculate the conditional entropy H(data | cond).*/
real condEntropy(T, U)(T data, U cond)
if(isInputRange!(T) && isInputRange!(U)) {
    return entropy(joint(data, cond)) - entropy(cond);
}

unittest {
    // This shouldn't be easy to screw up.  Just really basic.
    int[] foo = [1,2,2,1,1];
    int[] bar = [1,2,3,1,2];
    assert(approxEqual(entropy(foo) - condEntropy(foo, bar),
           mutualInfo(foo, bar)));
    writeln("Passed condEntroy unittest.");
}



/**Calculates the mutual information of two vectors of observations.
 */
real mutualInfo(T, U)(T x, U y)
if(isInputRange!(T) && isInputRange!(U)) {
    return entropy(x) + entropy(y) - entropy(joint(x, y));
}

unittest {
    // Values from R, but converted from base e to base 2.
    assert(approxEqual(mutualInfo(bin([1,2,3,3,8].dup, 10),
           bin([8,6,7,5,3].dup, 10)), 1.921928));
    assert(approxEqual(mutualInfo(bin([1,2,1,1,3,4,3,6].dup, 2),
           bin([2,7,9,6,3,1,7,40].dup, 2)), .2935645));
    assert(approxEqual(mutualInfo(bin([1,2,1,1,3,4,3,6].dup, 4),
           bin([2,7,9,6,3,1,7,40].dup, 4)), .5435671));

    writeln("Passed mutualInfo unittest.");
}

/**Calculates the conditional mutual information I(x, y | z).*/
real condMutualInfo(T, U, V)(T x, U y, V z) {
    return entropy(joint(x, z)) + entropy(joint(y, z)) -
           entropy(joint(x, y, z)) - entropy(z);
}

unittest {
    // Values from Matlab mi package by Hanchuan Peng.
    auto res = condMutualInfo([1,2,1,2,1,2,1,2].dup, [3,1,2,3,4,2,1,2].dup,
                              [1,2,3,1,2,3,1,2].dup);
    assert(approxEqual(res, 0.4387));
    res = condMutualInfo([1,2,3,1,2].dup, [2,1,3,2,1].dup,
                         joint([1,1,1,2,2].dup, [2,2,2,1,1].dup));
    assert(approxEqual(res, 1.3510));
    writeln("Passed condMutualInfo unittest.");
}

/**Calculates the entropy of any old input range of observations more quickly
 * than entropy(), provided that all equal values are adjacent.  If the input
 * is sorted by more than one key, i.e. structs, the result will be the joint
 * entropy of all of the keys.  The compFun alias will be used to compare
 * adjacent elements and determine how many instances of each value exist.*/
real entropySorted(alias compFun = "a == b", T)(T data)
if(isInputRange!(T)) {
    alias ElementType!(T) E;
    alias binaryFun!(compFun) comp;
    immutable n = data.length;
    immutable nrNeg1 = 1.0L / n;

    real sum = 0.0L;
    real nSame = 1.0L;
    auto last = data.front;
    data.popFront;
    foreach(elem; data) {
        if(comp(elem, last))
            nSame++;
        else {
            real p = nSame * nrNeg1;
            nSame = 1.0L;
            sum -= p * log2(p);
        }
        last = elem;
    }
    // Handle last run.
    real p = nSame * nrNeg1;
    sum -= p * log2(p);

    return sum;
}

unittest {
    uint[] foo = [1U,2,3,1,3,2,6,3,1,6,3,2,2,1,3,5,2,1].dup;
    assert(approxEqual(entropySorted(foo.dup.qsort), entropy(foo)));
    writeln("Passed entroySorted test.");
}

// Verify that there are no TempAlloc memory leaks anywhere in the code covered
// by the unittest.  This should always be the last unittest of the module.
unittest {
    auto TAState = TempAlloc.getState;
    assert(TAState.used == 0);
    assert(TAState.nblocks < 2);
}
