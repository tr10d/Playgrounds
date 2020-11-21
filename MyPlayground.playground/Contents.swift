//import UIKit
import Foundation

//var numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
//let Arr = [10...20]
//
//print(Arr)
//
//extension Array where Element == Int {
//
//    func timesTen() -> [Int] {
//        var output = [Int]()
//        for num in self {
//            output.append(num * 10)
//        }
//        return output
//    }
//}
//
//
//print(numbers.timesTen())
//print(numbers)
//
//
//func timesTen(_ x: Int) -> Int {
//    return x * 10
//}
//
//
//print(numbers.map(timesTen))
//print(numbers)
//
//
//print(numbers.map { $0 * 10 })
//print(numbers.map { x in x * 10 })
//print(numbers)
//
//let possibleNumbers = ["1", "2", "three", "///4///", "5"]
//let mapped = possibleNumbers.map {str in Int(str) }
//print (mapped) // [Optional(1), Optional(2), nil, nil, Optional(5)]
//let compactMapped = possibleNumbers.compactMap(Int.init)
//print (compactMapped) // [1, 2, 5]
//
//print(Int.init("123"))
//
//let value: Int? = 4
//if let value = value {
//   print("\(value) \(type(of: value))")
//} else {
//    print("\(value) \(type(of: value))")
//}
//
//enum LocalError: String {
//    case noData = "Нет данных"
//    case noConnect = "Нет конн"
//}
//let err = LocalError.init(rawValue: "Нет конн")
//print(err)
//
//
//
//
//struct Friend {
//
//    let name: String
//    let userName: String
////    let age: Int?
////    let city: String?
////    let isVIP: Bool
//
//    init(name: String) {
//        self.name = name
//        self.userName = name
//    }
//    init(userName: String) {
//        self.name = userName
//        self.userName = userName
//    }
//
//}
//
//let f1 = Friend.init(userName: "ff")
//let f2 = Friend(name: "df")
//
//
//func x(age: Int) {
//
//    guard age > 1 else {
//        return
//    }
//}


//1. Описать несколько структур – любой легковой автомобиль SportCar и любой грузовик TrunkCar.
//
//2. Структуры должны содержать марку авто, год выпуска, объем багажника/кузова, запущен ли двигатель, открыты ли окна, заполненный объем багажника.
//
//3. Описать перечисление с возможными действиями с автомобилем: запустить/заглушить двигатель, открыть/закрыть окна, погрузить/выгрузить из кузова/багажника груз определенного объема.
//
//4. Добавить в структуры метод с одним аргументом типа перечисления, который будет менять свойства структуры в зависимости от действия.
//
//5. Инициализировать несколько экземпляров структур. Применить к ним различные действия.
//
//6. Вывести значения свойств экземпляров в консоль.

//enum Enum1: Int {
//    case N1 = 1
//    case N2 = 2
//    case N3 = 3
//}
//struct St {
//    var I: Int
//}
//
//enum Paradigm {
//    case functional
//    case protocolOriented
//    case objectOriented
//    case imperative
//    case declarativeProgramming
//}
//struct ProgrammingLanguage {
//    let paradigm: [Paradigm]
//    let designedBy: [String]
//}
//
//let Swift = ProgrammingLanguage()

enum TypeAttach {
    case file
    case text
}


struct Emailletter {
    
    let from: String
    let to: String
    let subject: String
    
    var files = [String]()
    var text = ""
    var date = NSDate() as Date
    
//    init(from: String, to: String, subject: String) {
//        self.from = from
//        self.to = to
//        self.subject = subject
////        files = []
//    }
    mutating func send() {
        date = NSDate() as Date
        print("Писмо отправлено")
    }
    
    mutating func add(type: TypeAttach, object: String) {
        switch type {
        case .text:
            self.text = object
        case .file:
            files.append(object)
        }
     }
    
    func description() -> String {
        return
            """
            From: \(from)
            To: \(to)
            Date: \(String(describing: date))
            Subject: \(subject)
            \(text)
            Files: \(files)
            """
    }
}

var eletter1 = Emailletter(from: "aa@host.net", to: "bb@host.net", subject: "Test")
eletter1.add(type: .text, object: "Тестовое сообщение")
eletter1.add(type: .file, object: "Тестовый файл №1")
eletter1.add(type: .file, object: "Тестовый файл №2")
eletter1.send()

print(eletter1.description())


