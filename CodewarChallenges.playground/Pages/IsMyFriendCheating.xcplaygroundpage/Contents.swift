func removNb(_ n: Int) -> [(Int,Int)] {
    var response: [(Int,Int)] = []
    var numbers: [Int] = []
    var sumOfAll = 0
    
    for count in 1...n {
        numbers.append(count)
        sumOfAll += count
    }
    
    for i in numbers {
        let x = (sumOfAll - i) / (i + 1)
        
        if x > n { continue }
        
        let product = x * i
        let sum = sumOfAll - (x + i)
        
        if product == sum {
            response.append((i, x))
        }

    }
    
    return response
}

print(removNb(26))
print(removNb(100))
print(removNb(37))
print(removNb(101))
print(removNb(1001))
