import UIKit

let A, B, C, K1, K2, G, sum,percent, year: Double
var D, D1, D2, H, P, S, X1, X2, resultSum: Double
let noResult = "нет решения"

// Задание 1
// Ax2 + Bx + C = 0
A = 3
B = -14
C = -5

D = pow(B, 2) - 4 * A * C
D1 = sqrt(D) / (2 * A)
D2 = -B / (2 * A)

X1 = D2 + D1 // решение 1
X2 = D2 - D1 // решение 2

print("Задание 1")
print("X1:  \(X1)")
print("X2:  \(X2)")

// Задание 2
K1 = 3 // Катет 1
K2 = 4 // Катет 2

H = sqrt(pow(K1, 2) + pow(K2, 2)) // Гипотенуза
P = K1 + K2 + H // Периметр
S = K1 * K2 / 2 // Площадь

print("Задание 2")
print("Гипотенуза:  \(H)")
print("Периметр:  \(P)")
print("Площадь:  \(S)")

// Задание 3
sum = 10000 // Первоначальная сумма
percent = 10 // Процент в год
year = 5 // количество лет

resultSum = sum * pow(1 + percent / 100, year) // Сумма после year лет

print("Задание 3")
print("Сумма после \(year) лет: \(resultSum)")
