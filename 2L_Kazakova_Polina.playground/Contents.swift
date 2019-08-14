import Foundation

//функция, определяющая четное ли число
func one (num: Int) -> Bool{
if num % 2 == 0{
    return true
    }else{
    return false
    }
}
//функция, определяющая делится ли число на 3 без остатка
func two (num: Int) -> Bool{
if num % 3 == 0{
    return true
    }else{
    return false
    }
}
//возрастающий массив из 100 чисел
var someArray: Array<Int> = []
for i in 1...100
{
    someArray.append(i)
}
print (someArray)
//удаление элементов массива, которые нечетные и не делятся на 3 без остатка
someArray.removeAll (where: {one(num: $0)})
someArray.removeAll (where: {!two (num: $0)})
print (someArray)
//функция, которая добавляет новое число Фибоначчи. Добавление 100 элементов в массив.
func fibonacci (n: Int) -> (Decimal) {
    if (n<3){
        return 1
    }else{
        var value1: Decimal = 1, value2: Decimal = 1, value: Decimal
        for _ in 3...n {
            value = value1 + value2
            value1 = value2
            value2 = value
        }
        return value2
    }
}
var someNewArray = [Decimal]()
someNewArray.append(0)
var n = 100
for i in 1...n {
    someNewArray.append (fibonacci(n: i))
}
print (someNewArray)
//второй вариант функции Фибоначчи сразу с массивом
func fibonacci2 (n:Int) -> [Decimal]{
    var a: [Decimal] = [0, 1]
    while a.count < n {
        a.append(a[a.count - 1] + a[a.count - 2])
    }
    return a
}
print (fibonacci2(n: 101))

//заполнение массива 100 элементами методом Эратосфена
func three (_ number: Int) -> Bool {
    return number > 1 && !(2..<number).contains { number % $0 == 0 }
}
    var tooMuchArrays: [Int] = [2]
var p: Int = 2
while tooMuchArrays.count < 100 {
    p += 1
    if three(p) {
        tooMuchArrays.append(p)
    }
}
print(tooMuchArrays)

