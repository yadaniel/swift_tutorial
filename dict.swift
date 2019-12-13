#!/cygdrive/c/Swift/bin/swift

// make dict
var d: [Int:Int] = [:]
var d1 = [Int:Int]()
var d2 = Dictionary<Int,Int>()

print(d)
d[0] = 100
print(d)
d[0] = 200
print(d)
d[0] = 300
d[1] = 1
print(d)
d[0] = nil
print(d)
// try print(d[0]!)
print("d[1]! =", d[1]!)
print("d[1, default:0] =", d[1, default:0])
print("d[2, default:0] =", d[2, default:0])

class EC : Error {}
class ES : Error {}
enum EE : Error { case E0, E1, E2 }

do {
    // readLine returns String?
    let n = readLine()
    switch(Int(n!)) {
        case 1: throw EC()
        case 2: throw ES()
        case 3: throw EE.E0
        default:
            // break here required
            break
    }
} catch is EC {
    print("catch class")
} catch is ES {
    print("catch struct")
} catch {
    print("catch all")
}













