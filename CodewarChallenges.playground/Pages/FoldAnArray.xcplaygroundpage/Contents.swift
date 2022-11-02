func foldArray(_ arr: [Int], times: Int) -> [Int] {
    
    let arrayIsValid = arr.count > 1
    
    if times > 0 && arrayIsValid {
        let firstHalf: [Int]
        let secondHalf: [Int]
        var sumOfHalfs: [Int]
        
        let isOdd = !arr.count.isMultiple(of: 2)
        let middleIndex = Int(arr.count / 2)
        
        let firstHalfSlice = arr.prefix(upTo: middleIndex)
        var secondHalfSlice = arr.suffix(from: middleIndex)
        
        if  secondHalfSlice.count > 1 {
            if isOdd {
                secondHalfSlice.removeFirst()
            }
            
            secondHalfSlice.reverse()
        }

        firstHalf = Array(firstHalfSlice)
        secondHalf = Array(secondHalfSlice)
        
        sumOfHalfs = mergeArraysSum(firstHalf, secondHalf)
        
        if isOdd {
            sumOfHalfs.append(arr[middleIndex])
        }
        
        return foldArray(sumOfHalfs, times: times - 1)
    } else {
        return arr
    }
}

func mergeArraysSum(_ arr1: [Int], _ arr2: [Int]) -> [Int] {
    var response = [Int]()
    
    for index in 0...(arr1.count - 1) {
        response.append(arr1[index] + arr2[index])
    }
    
    return response
}


print(foldArray([1,2,3,4,5], times: 1)) //[6,6,3]
print(foldArray([1,2,3,4,5], times: 2)) //[9,6]
print(foldArray([9, 6], times: 1)) //[9,6]
print(foldArray([-9,9,-8,8,66,23], times: 40)) //[14,75,0]
