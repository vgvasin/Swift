import UIKit
//Задание 1
//ax^2 + bx + c = 0
var x1: Double = 0
var x2: Double = 0
var D: Double = 0

let a: Double = 0.5
let b: Double = 0.125
let c: Double = 0
//Дискриминант
D = b*b - 4*a*c
//нахождение корней исходя из свойств дискриминанта
if D>0 {
    x1 = (-b + sqrt(D))/(2*a)
    x2 = (-b - sqrt(D))/(2*a)
    print("x1 = \(x1); x2 = \(x2)")
} else if D == 0 {
    x1 = (-b + sqrt(D))/(2*a)
    print("x1 = x2 = \(x1)")
} else {
    print("Корней нет")
}


//Задание 2
var P2: Double = 0
var S2: Double = 0
var c2: Double = 0

let a2: Double = 3
let b2: Double = 4

c2 = sqrt(a2*a2 + b2*b2)
S2 = (a2*b2)/2
P2 = a2 + b2 + c2

//задание 3
var deposit: Double = 1000
var percent: Double = 10
var i = 1
while (i <= 5) {
    deposit = deposit + (deposit * percent / 100)
    i = i + 1
}
print(deposit)

