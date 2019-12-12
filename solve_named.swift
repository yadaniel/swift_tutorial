#!/cygdrive/c/Swift/bin/swift

// named tuple can be used with names or positional

typealias Char = Character

let nmap: [Char:[(city: Char, distance: UInt)]] = [
    "A" : [("S", 4875), ("R", 5844), ("N", 6393), ("K", 4275)],
    "S" : [("A", 4875), ("R", 1310), ("H", 2773), ("N", 2688), ("K", 3502)],
    "R" : [("A", 5844), ("S", 1310), ("H", 1631), ("N", 3371)],
    "H" : [("S", 2773), ("R", 1631), ("N", 3758)],
    "N" : [("A", 6393), ("S", 2688), ("R", 3371), ("K", 2768)],
    "K" : [("A", 4275), ("S", 3502), ("N", 2768)],
]

var ways: [(city_chain: String, total_distance: UInt)] = []

func solve(n: Char, way: String, len: UInt) {
    if way.contains(n) {
        return
    }
    for (k,km) in nmap[n]! {
        if k == "S" && way.count == 5 {
          // ways.append((way + "S", len + km))
          ways.append((city_chain: way + "S", total_distance: len + km))
        } else {
            solve(n: k, way: way + String(n), len: len + km)
        }
    }
}


solve(n: "S", way: "", len: 0)

print(ways)
print(ways.count)
// positional
print(ways.map({$0.1}).min()! as UInt)
print(ways.map({$0.1}).max()! as UInt)
// named
print(ways.map({$0.total_distance}).min()! as UInt)
print(ways.map({$0.total_distance}).max()! as UInt)

