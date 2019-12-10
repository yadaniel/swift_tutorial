// language features

// integral types
let _: Int = 0
let _: UInt = 0
let _: Float = 0
let _: Double = 0
let _: Character = "A"
let _: String = "A"
let _: Bool = false
let _: Void = ()

// more integral types
let _: Int8 = 0
let _: Int16 = 0
let _: Int32 = 0
let _: Int64 = 0
let _: UInt8 = 0
let _: UInt16 = 0
let _: UInt32 = 0
let _: UInt64 = 0

func takeInt(i: Int16) {
    print("in takeInt => \(i)")
}
takeInt(i: 1) // implicit
takeInt(i: 1 as Int16)
var q: UInt8 = 1
/* takeInt(i: q as Int16) */
takeInt(i: Int16(q))

typealias Vec = [Bool]

// composed types
let _: [Int] = []
let _: Array<Int> = []
let _: [Int:Int] = [:]
let _: Dictionary<Int,Int> = [:]
let _: Set<Int> = []

let _ = [1,2,3]
let _ = [1:1, 2:2, 3:3]
let _ = Set([1,2,3])

// complex composed types
let p0: Int? = nil
let p1: Int? = Optional.none
let p2: Int? = Optional.some(0)
let _: Optional<Int> = nil
let _: Optional<Int> = Optional.none
let _: Optional<Int> = Optional.some(0)

if p0 == p1 {
    print("nil == none")
}
if let x = p2 {
    // compare to rust syntax
    // if let Some(x) = p2 {} else {}
    print("p2 was some with", x, "wrapped")
} else {
    print("p2 was none")
}

let _: Optional<Array<Optional<Int>>> = nil
let _ = Optional.some(1)
let _ = Optional.some(1.0)
let _ = Optional.some(1.0 as Float)

enum Either<A,B> {
    case Left(A);
    case Right(B)
}
let _: Either<Int,Double> = Either.Left(1)


// enum without data
enum E0 {case A; case B; case C}
enum E1 {case A; case B; case C;}

// enum with data = discrimated union
enum E2 {
    case A;
    case B(Int);
    case C(Int,Int)
}

// public, internal, private
public class Cpub {}
private class Cpri {}
internal class Cint {}

public struct Spub {}
private struct Spri {}
internal struct Sint {}

// class
class C {
    var x: Int8

    func double() {
        x *= 2
    }

    init() {
        print("C::init")
        x = 1
    }

    deinit {
        print("C::deinit")
    }
}

// struct can not have deinit
struct S {
    var x: Int8

    mutating func double() {
        x *= 2
    }

    init() {
        print("S::init")
        x = 1
    }

    /*
    deinit {
        print("S::deinit")
    }
    */

}

func test_class() {
    let c1 = C()
    let c2 = c1
    c1.double()
    c2.x = 100
    print(c1.x)
}

func test_struct() {
    var s1 = S()
    var s2 = s1
    s1.double()
    s2.x = 100
    print(s1.x)
}

// using functions
func outer() {
    func inner(x: UInt8) -> Void {
        switch(x) {
            case 0,1,2: return ()
            default: return ()
        }
    }
    inner(x:1)
}

// outername innername
func foo(outername innername: Int) {
    print("in foo", innername)
}
foo(outername: 1)

// inout
func bar(x: inout Int) {
    x = 10
}
var i = 0
print(bar(x: &i))

// using function pointers

func x1(x: Int) -> Int { return x }
func x2(x: Int) -> Int { return 2*x }
func x3(x: Int) -> Int { return 3*x }

func xx1(x1: Int, x2: Int) -> Int { return x1+x2 }
func xx2(x1: Int, x2: Int) -> Int { return 2*x1+x2 }
func xx3(x1: Int, x2: Int) -> Int { return 3*x1+x2 }

func y1(x: (Int,Int)) -> Int { return x.0 + x.1 }
func y2(x: (Int,Int)) -> Int { return 2*x.0 + x.1 }
func y3(x: (Int,Int)) -> Int { return 3*x.0 + x.1 }

func swap1(x: (Int,Int)) -> (Int,Int) { return (x.1,x.0) }
func swap2(x: (Int,Int)) -> (Int,Int) { return (2*x.1,2*x.0) }
func swap3(x: (Int,Int)) -> (Int,Int) { return (3*x.1,3*x.0) }

func test1() -> Void {
    let fn1: (Int)->Int = x1
    print(fn1(10))
    //
    let fn2: (Int,Int)->Int = xx1
    print(fn2(10, 20))
    //
    let fn3: ((Int,Int))->Int = y1
    print(fn3((10, 20)))
    //
    let fn4: ((Int,Int))->(Int,Int) = swap1
    print(fn4((1,2)))
}

func test2() {
    print(CommandLine.arguments.count)
    for cmd in CommandLine.arguments {
        print(cmd)
    }

    // loops
    for _ in 0...10 {}
    for _ in 0..<10 {}

    while(false) {}

    repeat {
    } while(false)

    // nested loops with labels
    var (i,j) = (0,0)
w1: while(i<10)  {
        i += 1
    w2: while(j<10) {
            j += 1
            if i+j == 15 { break w2 }
            if i+j == 20 { continue w1 }
        }
    }

n1: for i in 1...10 {
    n2: for j in 1...10 {
            if i+j == 15 {
                break n2
            } else if i+j == 10 {
                continue n2
            } else if i+j == 20 {
                break n1
            }
        }
   }

}

let lines = """
    line1
    line2
    line3
"""
print("lines.count() = ", lines.count, "chars")
let l: [Substring] = lines.split(separator: " ")
for line in lines.split(separator: " ") {
    print(line)
}
for (idx,line) in lines.split(separator: " ").enumerated() {
    print(idx, " => ", line)
}
/* for char in lines { */
    /* print(line) */
/* } */

func main() {
    test_class()
    test_struct()
    test1()
    test2()
}

main()

