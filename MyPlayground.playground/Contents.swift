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
func generateArray(_ Number: Int) -> [Int] {
    
    var array = [Int]()
    
    for i in 1...Number {
        array.append(i)
    }
    
    return array
}
let result3 = generateArray(100)
print("Массв из 100 элементов: \(result3.description)")


//4. Удалить из этого массива все четные числа и все числа, которые не делятся на 3.
func deleteItems(array: [Int]) -> [Int] {
    
    var newArray = [Int]()
    
    for i in 0..<array.count {
         if !isEvenNumber(Number: array[i]) && !isDivisibilityBy3(Number: array[i]){
            newArray.append(array[i])
        }
    }
    return newArray
}
let result4 = deleteItems(array: result3)


// 5. * Написать функцию, которая добавляет в массив новое число Фибоначчи, и добавить при помощи нее 100 элементов. Числа Фибоначчи определяются соотношениями Fn=Fn-1 + Fn-2.
func addFibonacciNumber(array: inout [Double]) {
    let count = array.count
    if count < 2 {
            array.append(1)
        } else {
            array.append(array[count - 1] + array[count - 2])
        }
}
let amountOfNumbers = 100
var result5 = [Double]()
for _ in 1...amountOfNumbers {
    addFibonacciNumber(array: &result5)
}
print("\(amountOfNumbers) чисел Фибонначи : \(result5)")


/* 6. * Заполнить массив из 100 элементов различными простыми числами. Натуральное число, большее единицы, называется простым, если оно делится только на себя и на единицу. Для нахождения всех простых чисел не больше заданного числа n, следуя методу Эратосфена, нужно выполнить следующие шаги:
a. Выписать подряд все целые числа от двух до n (2, 3, 4, ..., n).
b. Пусть переменная p изначально равна двум — первому простому числу.
c. Зачеркнуть в списке числа от 2 + p до n, считая шагом p..
d. Найти первое не зачёркнутое число в списке, большее, чем p, и присвоить значению переменной p это число.
e. Повторять шаги c и d, пока возможно. */
func getPrimeNumbers(_ array: inout [Int]) {
    var P:Int
    
    for i in 1..<array.count {
         if array[i] > 0 {
            P = array[i] * array[i]
            while P <= array.count {
                array[P - 1] = 0
                P += array[i]
            }
        }
    }
}
let amountPrimeNumber = 100
var array = generateArray(amountPrimeNumber)
getPrimeNumbers(&array)
let result6 = array
    .filter { $0 > 1 }
print("Простые числа до \(amountPrimeNumber): \(result6)")
