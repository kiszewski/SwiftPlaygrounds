func findOutlier(_ array: [Int]) -> Int {
    let evens = array.filter({item in item.isMultiple(of: 2)})
    
    if evens.count == 1 {
        return evens.first!
    } else {
        return array.first(where: { item in
            !item.isMultiple(of: 2)
        })!
    }
}

print(findOutlier([2, 4, 0, 100, 4, 11, 2602, 36])) //11
print(findOutlier([160, 3, 1719, 19, 11, 13, -21])) //160
