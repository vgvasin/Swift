import UIKit

struct Queue<T> {
    var internalArray = [T]()
    var count: Int{
        return internalArray.count
    }
    mutating func add(_ item: T){
        internalArray.append(item)
    }
    mutating func add(_ item: [T]){
        self.internalArray.append(contentsOf: item)
    }
    mutating func remove() -> T?{
        if internalArray.count > 0 {
            return internalArray.removeFirst()
        } else {
            return nil
        }
    }
    
    public func filter(array: [T], predicateSomeClosure: (T) -> Bool) -> [T]{
        var tmpArray = [T]()
        for element in array{
            if predicateSomeClosure(element){
                tmpArray.append(element)
            }
        }
        return tmpArray
    }
    
    subscript(index: Int) -> T?{
        if index > internalArray.count || index < 0{
            return nil
        }else{
            return internalArray[index]
        }
    }
}
var queue = Queue<Int>()
queue.add([1,2,3,4,5,6,7,8,9])
print(queue)
let filterQueue = queue.filter(array: queue.internalArray) {(i: Int) -> Bool in
    return i % 2 == 1
}
print(filterQueue)
queue.count
