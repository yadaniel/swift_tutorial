#!/cygdrive/c/Swift/bin/swift

// enum
enum E0 {
    case A0, A1
}

// full path
let e1 = E0.A0
if e1 == .A0 {
    print("A0")
}

// local path
let e2:E0 = .A1
if e2 == .A1 {
    print("A1")
}

// enum (discriminated union)
enum E1 {
    case A0(Int), A1
}

let e: E1 = .A0(10)
print(e)

// check if e is of A0
if case let E1.A0(x) = e {
    print(x)
}

switch e {
    case .A0(let x):
        print(x)
    default:
        print("default")
}

// enum (discriminated union)
enum E2 {
    case A0(Int)
    case A1(Double)
    case A2, A3
    case A4(Float, Float)
    case A5, A6
}

let e3: E2 = .A2
switch e3 {
    /* case .A0(let _), .A2, .A3:  */
    case .A0, .A2, .A3: 
        print("A0,A2,A3")
    case E2.A1(var x):
        print(x)
        x = 10
        print(x)
        print("A1")
    case .A5, .A6:
        print("A5,A6")
        fallthrough
    default:
        print("default")
}

// enum
enum E3 {
    case A, B
    case C, D
    case E(Int), F(Float)
    case G; case H; case I; case J
}

// extension

extension String {
    func rev() -> String {
        var newVal = ""
        for _ in 0..<self.count {
            newVal.append(".")
        }
        return newVal
    }
    func double() -> String {
        return self + self
    }
}

print("abc".double())


