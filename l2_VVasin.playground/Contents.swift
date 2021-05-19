import UIKit
//1.
var numberArray = [65, 42, 39, 61, 86, 53, 28, 99]

func even() {
    for sorting in numberArray{
        if sorting % 2 == 0 {
            print("\(sorting) четное число")
        } else {
            print("\(sorting) нечетное число")
        }
    }
}
even()

//2.
func div() {
    for sorting in numberArray{
        if sorting % 3 == 0{
            print("\(sorting) делиться 3")
        } else{
            print("\(sorting) не делиться 3")
        }
    }
}
div()

//3.
var arr: [Int] = []
for i in 1...100{
        arr.append(i)
    }
print(arr)

//4.
var toDelete = arr.filter {$0 % 2 != 0 && $0 % 3 == 0}
print(toDelete)

//5.
func fibonacciArray(_ n: Int) -> [Decimal] {
    var fibonacci: [Decimal] = [1, 1]
    (2...n).forEach{ i in
        fibonacci.append(fibonacci[i - 1] + fibonacci[i - 2])
    }
    return fibonacci
}
print(fibonacciArray(100))


//6.
func primeNumbers(arrayPassed: [Int]) -> [Int] {
    var primes: [Int] = []
    var newArr = arrayPassed
    while let newP = newArr.first {
        primes.append(newP)
        newArr = newArr.filter { $0 % newP != 0 }
    }
    return primes
}
print(primeNumbers(arrayPassed: Array(2...100)))
