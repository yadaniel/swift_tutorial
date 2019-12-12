#!/cygdrive/c/Swift/bin/swift

import wx

// omit paramter names in function call

func foo(_ x: Int, _ y: Int) -> Int {
    if x > y { 
        return x
    }
    return y
}

print(foo(1,2))

func bar(x: Int, y: Int) -> Int {
    if x > y { 
        return x
    }
    return y
}

print(bar(x:1, y:2))

// map

let a = [1,2,3,4,5]
print(a.map({$0 * 2}))

let b = [(1,10),(2,20),(3,30),(4,40),(5,50)]
print(b.map({$0.0 * 2}))
print(b.map({$0.1 * 2}))

// 

func foobar() {
    print("at top")
    defer {
        print("foobar defer first")
    }
    print("at bottom")
    // return
    // defer instructions will not be executed when defer statement is not executed
    defer {
        print("foobar defer second")
    }
}

foobar()

// command line
print(CommandLine.arguments)

// ranges
for _ in 1...10 {}
for _ in 1..<10 {}
print((1...10).map({$0 * 10}))
print((1..<10).map({$0 * 10}))

// flatmap ... [[Int]] -> [Int]
print("flatMap", [[1,2,3],[2,3],[0]].flatMap({$0}))

// compactMap returns non-zero elements
print("compactMap", [1,2,3,Optional.some(4),Optional.none].compactMap({$0}))
print([[1,2,3],2,3,nil].compactMap({$0}))
print([[1,2,3],2,3].compactMap({ x in }))  // returns ()
print([[1,2,3],2,3].compactMap({ x in x }))
print([[1,2,3],2,3].compactMap({ x in return x }))

// filter
print((1...10).filter({1 <= $0 && $0 <= 5}))

// reduce 
print((1...10).reduce(0, { $0 + $1 }))
print((1...10).reduce(0, { return $0 + $1 }))
print((1...10).reduce(0, { (x,y) in x + y }))
print((1...10).reduce(0, { x,y in x + y }))
print((1...10).reduce(0, { x,y in return x + y }))
print((1...10).reduce(1, {$0 * $1}))

// random
// print(Int.random(in: 1...100))
// print(Bool.random())
// print(Int(arc4random_uniform(2)))
// var rng = SystemRandomNumberGenerator()

