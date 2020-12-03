import UIKit

// =================================
// MARK: - Hometask
// =================================

/*
 Для решения данных задач используйте Generics и Closures */

/*
 1. Реализуйте универсальную функцию для выполнения простых математических операций
 2. Реализуйте универсальную функцию, которая отсортирует массив по возрастанию или убыванию
 3. Реализуйте универсальную функцию, которая отсортированный массив из задачи 2 запакует в словарь,
 где порядковый номер элемента - это ключ, а значение массива перенесите в значение словаря. */


// =================================
// MARK: - Task 1
// =================================

func simpleMath<T: Numeric>(num1: T, num2: T, closure: (T, T) -> T) -> T {
    var result: T
    result = closure(num1, num2)
    return result
}

print(simpleMath(num1: 5, num2: 4) { $0 + $1 })
print(simpleMath(num1: 2.2, num2: 3.3) { $0 * $1 })




// =================================
// MARK: - Task 2
// =================================

func sortedArray<T>(array: [T], closure: (T, T) -> Bool) -> [T] {
    let sortedArray: [T] = array.sorted(by: closure)
    return sortedArray
}

print(sortedArray(array: [3, 4, 2, 1, 6, 5]) { $0 > $1 })
print(sortedArray(array: [3, 4, 2, 1, 6, 5]) { $0 < $1 })



// =================================
// MARK: - Task 3
// =================================

func sortedAndCreatDictionary<T>(array: [T], closure: (T, T) -> Bool) -> [Int: T] {
    let sortedArray: [T] = array.sorted(by: closure)
    let newDictionary: [Int: T] = sortedArray.enumerated().reduce(into: [Int: T]()) { (value, key) in
        value[key.offset] = key.element
    }
    return newDictionary
}

var dict = sortedAndCreatDictionary(array: ["a", "b", "c", "d"]) { $0 < $1 }

print(dict)
