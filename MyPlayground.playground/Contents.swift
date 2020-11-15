import UIKit

var A,B,C,D,D1,D2,X1,X2,P,S,sum,percent,year,resultSum: Double

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


// Задание 2
A = 3 // Катет 1
B = 4 // Катет 2

C = sqrt(pow(A, 2) + pow(B, 2)) // Гипотенуза
P = A + B + C // Периметр
S = A * B / 2 // Площадь


// Задание 3
sum = 10000 // Первоначальная сумма
percent = 10 // Процент в год
year = 5 // количество лет

resultSum = sum * pow(1 + percent / 100, year) // Сумма после year лет
