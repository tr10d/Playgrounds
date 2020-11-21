import Foundation

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

enum TypeAttach {
    case file(_ file: String)
    case text(_ text: String)
    case subject(_ subject: String)
}

struct Emailletter {
    let from, to: String
    var subject = ""
    var files = [String]()
    var text = ""
    var date = NSDate() as Date
    
    init(from: String, to: String) {
        self.from = from
        self.to = to
    }
    
    mutating func add(_ type: TypeAttach) {
        switch type {
        case let .text(text):
            self.text = text
        case let .file(file):
            files.append(file)
        case let .subject(subject):
            self.subject = subject
       }
     }
    
    mutating func send() {
        print("Писмо отправлено")
    }
    
    func presentation() {
        print("From: \(from)")
        print("To: \(to)")
        print("Date: \(String(describing: date))")
        if !subject.isEmpty {
            print("Subject: \(subject)")
        }
        print("\(text)")
        if !files.isEmpty {
            print("Files: \(files)")
        }
    }
    
}

var letter: Emailletter
    
letter = Emailletter(from: "aa@host.net", to: "bb@host.net")
letter.add(.text("Тестовое сообщение"))
letter.add(.file("Тестовый файл №1"))
letter.add(.file("Тестовый файл №2"))
letter.send()
letter.presentation()

letter = Emailletter(from: "bb@host.net", to: "aa@host.net")
letter.add(.text("Hello, world"))
letter.send()
letter.presentation()
