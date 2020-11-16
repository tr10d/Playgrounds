import UIKit
import Foundation

//let array = [1,3,4,5,6,7,8,9,10]
//let p = array.filter( $0 % 2 == 0)


func isEvenNumberr(Number: Int) -> Bool {
    return Number % 2 == 0
}
let Number = 11
let result = isEvenNumberr(Number: Number) ? "четное" : "не четное"

print("Число '\(Number)' \(result)")



func isPrimeNumber(Number: Int) -> Bool {
    return Number % 2 == 0
}






func fibonacciNumbers(amountOfNumbers: Int) -> [Int] {
    
    var array = [Int]()
    for index in 0..<amountOfNumbers {
        if index < 2 {
            array.append(1)
        } else {
            array.append(array[index - 1] + array[index - 2])
       }
    }
    
   return array
}
let amountOfNumbers = 50
let Numbers = fibonacciNumbers(amountOfNumbers: amountOfNumbers)

print("\(amountOfNumbers) чисел Фибонначи : \(Numbers.description)")

