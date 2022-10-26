import UIKit

func solution(_ number: Int) -> String {
    let numberString = String(number)
    let numberSize = numberString.count
    var index = 0
    
    var roman = numberString.map({ n in
        let num: String = String(n)
        
        let zeroLength = (numberSize - index - 1)
        
        index += 1
        return getLetterFromNumber(number: num, zerosCount: zeroLength)
    }).joined()
    
    return roman
}

func getLetterFromNumber(number: String, zerosCount: Int) -> String {
    var num = number
    var times = 1
    var nextRest = ""
    
    if(zerosCount > 0) {
        for _ in 1...zerosCount {
            num += "0"
        }
    }
    
    let intNumber = Int(num) ?? 0
    
    print(intNumber)
    
    let keys = codes.keys.sorted()
    
    let key = keys.reversed().first(where: { n in
        n <= intNumber
    }) ?? 0
    
    if(key == 0) {
        return ""
    }
    
    var romanCode = codes[key] ?? ""
    
    times = intNumber / key
    var rest = intNumber % key
    

    if(rest > 0) {
        if(String(rest).first == "4") {
            var nextRomanCode = getNextRomanCode(previous: romanCode)
            
           return  solution(rest / 4) + nextRomanCode
        } else {
            nextRest = solution(rest)
        }
    }
    
    if(times > 1)  {
        if(times > 3) {
            var nextRomanCode = getNextRomanCode(previous: romanCode)
            
            romanCode += nextRomanCode
        } else {
            let singleRomanCode = romanCode
            
            for _ in 2...times {
                romanCode += singleRomanCode
            }
        }
    }
    
    return romanCode + nextRest
}

func getNextRomanCode(previous: String) -> String {
    var response = ""
    var isNext = false
    
    codes.keys.sorted().forEach { key in
        if(isNext) {
            response = codes[key] ?? ""
        }
        
        isNext = codes[key] == previous
    }
    
    return response
}

let codes = [
    1: "I",
    5: "V",
    10: "X",
    50: "L",
    100: "C",
    500: "D",
    1000: "M",
]



print(solution(664))    //CDXLIV

