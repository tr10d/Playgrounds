import UIKit
import Foundation

var Number: Int

//1. Написать функцию, которая определяет, четное число или нет.
func isEvenNumber(Number: Int) -> Bool {
    return Number % 2 == 0
}
Number = 11
let result1 = isEvenNumber(Number: Number) ? "четное" : "не четное"

print("Число '\(Number)' \(result1)")


//2. Написать функцию, которая определяет, делится ли число без остатка на 3.
func isDivisibilityBy3(Number: Int) -> Bool {
    return Number % 3 == 0
}
Number = 13
let result2 = isDivisibilityBy3(Number: Number) ? "делится" : "не делится"

print("Число '\(Number)' \(result2) на 3")




//3. Создать возрастающий массив из 100 чисел.
func generateArray(Number: Int) -> [Int] {
    
    var array = [Int]()
    
    for i in 1...Number {
        array.append(i)
    }
    
    return array
}
let result3 = generateArray(Number: 100)
print("Массв из 100 элементов: \(result3.description)")




//4. Удалить из этого массива все четные числа и все числа, которые не делятся на 3.
func deleteItems(array: [Int]) {
    
    var newArray = [Int]()
    
    for i in 0..<array.count {
        switch array[i] {
        case :
            <#code#>
        default:
            <#code#>
        }
        if isEvenNumber {
            newArray.append(array[i])
        }
    }
}

let result4 = deleteItems(array: result3)




//5. * Написать функцию, которая добавляет в массив новое число Фибоначчи, и добавить при помощи нее 100 элементов.
//Числа Фибоначчи определяются соотношениями Fn=Fn-1 + Fn-2.
//
//6. * Заполнить массив из 100 элементов различными простыми числами. Натуральное число, большее единицы, называется простым, если оно делится только на себя и на единицу. Для нахождения всех простых чисел не больше заданного числа n, следуя методу Эратосфена, нужно выполнить следующие шаги:
//a. Выписать подряд все целые числа от двух до n (2, 3, 4, ..., n).
//b. Пусть переменная p изначально равна двум — первому простому числу.
//c. Зачеркнуть в списке числа от 2 + p до n, считая шагом p..
//d. Найти первое не зачёркнутое число в списке, большее, чем p, и присвоить значению переменной p это число.
//e. Повторять шаги c и d, пока возможно.

//let array = [1,3,4,5,6,7,8,9,10]
//let p = array.filter( $0 % 2 == 0)

// Четность



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

