import Foundation

func solution(_ text: String) -> Int {
    var response = 0
    var count = 1
    var list = text.map { String($0) }
    
    for letter in list {
        let currentValue = getValue(letter)
        
        let hasNextValue = count < list.count
        
        if hasNextValue {
            let nextValue = getValue(list[count])
            
            if nextValue > currentValue {
                response -= currentValue
            } else {
                response += currentValue
            }
            
        } else {
            response += currentValue
        }
        
        count += 1
    }
    
    return response
}

func getValue(_ letter: String) -> Int {
    codes[letter]!
}

let codes = [
    "I": 1,
    "V": 5,
    "X": 10,
    "L": 50,
    "C": 100,
    "D": 500,
    "M": 1000,
]

print(solution("I"))
print(solution("II"))
print(solution("III"))
print(solution("IV"))
print(solution("V"))
print(solution("VI"))
print(solution("VII"))
print(solution("VIII"))
print(solution("IX"))
print(solution("X"))
