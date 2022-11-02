import UIKit

func comp(_ a: [Int], _ b: [Int]) -> Bool {
    
    let rightSame = a.map({ value in
        value * value
    })
    
    let containAllValues = b.allSatisfy(rightSame.contains)
    
    let hasSameLenghts = b.allSatisfy({ value in
        let bFiltered: [Int] = b.filter({ e in e == value})
        let rightFiltered: [Int] = rightSame.filter({ e in e == value})
        
        return bFiltered.count == rightFiltered.count
    })
    
    return containAllValues && hasSameLenghts
}

let a = [121, 144, 19, 161, 19, 144, 19, 11]
let b = [121, 14641, 20736, 361, 25921, 361, 20736, 361]

print(comp(a, b))
