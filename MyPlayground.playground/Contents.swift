import Foundation

enum EMailParsingError: Error {
    case invalidLocalPart, invalidCharLocalPart
    case invalidDomain, invalidCharDomain
    case internalError
    case noParts(Int)
}

struct Email {
    let localPart: String
    let domain: String
}

func parseEmail(email: String) throws -> Email {

    let splitEmail = email.split(separator: "@")
    
    guard !splitEmail.contains("@") else { throw EMailParsingError.internalError }
    guard splitEmail.count == 2 else { throw EMailParsingError.noParts(splitEmail.count) }
    
    let localPart = String(splitEmail[0])
    let domain = String(splitEmail[1])
    
    guard localPart.count <= 64 else { throw EMailParsingError.invalidLocalPart }
    guard localPart.range(of: "[a-zA-Z0-9!#$%&'*+-/=?^_`{|}~.]*", options: .regularExpression) != nil else {
        throw EMailParsingError.invalidCharLocalPart
    }
    guard localPart.range(of: #"\.{2,}"#, options: .regularExpression) == nil else {
        throw EMailParsingError.invalidCharLocalPart
    }
    guard localPart.range(of: #"^\.|\.$"#, options: .regularExpression) == nil else {
        throw EMailParsingError.invalidCharLocalPart
    }

    guard domain.count <= 255 else { throw EMailParsingError.invalidDomain }
    guard domain.range(of: "[a-zA-Z0-9!#$%&'*+-/=?^_`{|}~.]*", options: .regularExpression) != nil else {
        throw EMailParsingError.invalidCharDomain
    }
    
    return Email(localPart: localPart, domain: domain)
}

do {
    print(try parseEmail(email: "simple@example.com"))
} catch let error as EMailParsingError {
    switch error {
    case .invalidLocalPart:
        print("Длина имени почтового ящика должна быть не более 64 знаков")
    case .invalidCharLocalPart:
        print("В имени почтового ящика есть недопустимые символы")
    case .invalidDomain:
        print("Длина домена должна быть не более 255 знаков")
    case .invalidCharDomain:
        print("В имени домена есть недопустимые символы")
    case .internalError:
        print("Отсутствует знак @")
    case .noParts(let count):
        print("Не хватает \(2 - count) частей адреса")
    }
} catch {
    print("Неизвестная ошибка: \(error)")
}
