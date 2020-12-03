import Foundation

class Sequence<T> {
    enum TypeOfPop {
        case fifo, lifo
    }
    
    var array = [T]()
    
    func push(_ element: T) -> Self {
        array.append(element)
        return self
    }
    
    func pop(_ type: TypeOfPop) -> T? {
        switch type {
        case .fifo:
            return array.popLast()
        case .lifo:
            return array.removeFirst()
        }
    }
    
    func filter(_ condition: (T) -> Bool) -> [T] {
        var result = [T]()
        for item in array {
            if condition(item) {
                result.append(item)
            }
        }
        return result
    }
    
    subscript(index: Int) -> T? {
        return array.count > index ? array[index] : nil
    }
}

extension String {
    
    subscript(_ index: Int) -> Character? {
        if self.count > index {
            return self[self.index(self.startIndex, offsetBy: index)]
        } else {
            return nil
        }
    }
}

let a = Sequence<String> ()
a.push("1").push("2").push("3").pop(.lifo)

let b = Sequence<Int> ()
for x in 0...11 { b.push(x) }
b.pop(.fifo)

let c = a[0]
let d = b.filter { $0 > 3 && $0 < 7 }


let s = "cafe\u{301}"
s[3]
