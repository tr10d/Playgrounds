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
    
//    func ini() {
//        
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

var letter1 = Emailletter(from: "aa@host.net", to: "bb@host.net", subject: "Test")
letter1.add(type: .text, object: "Тестовое сообщение")
letter1.add(type: .file, object: "Тестовый файл №1")
letter1.add(type: .file, object: "Тестовый файл №2")
letter1.send()

print(eletter1.description())

var letter2 = Emailletter(from: "bb@host.net", to: String"aa@host.net", subject: "", text: "Hello, world")
