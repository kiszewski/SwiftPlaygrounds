func playPass(_ s: String, _ n: Int) -> String {
    String(upperAndLowerText(replaceByComplement(shift(s.uppercased(), n))).reversed())
}

let ZInAssci = 90
let AInAscii = 64

func shift(_ text: String, _ qtd: Int) -> String {
    var response = ""
    let list = text.map { $0 }
    
    for index in 0..<list.count {
        let letter = list[index]
        
        if letter.isLetter {
            let asciiDecimal = Int(letter.asciiValue!)
            let uni: UnicodeScalar
            
            let nextAsciiDecimal = asciiDecimal + qtd
            let isBeforeZ = nextAsciiDecimal <= ZInAssci
            
            if isBeforeZ {
                uni = UnicodeScalar(nextAsciiDecimal)!
            } else {
                let diff = asciiDecimal - ZInAssci
                uni = UnicodeScalar(AInAscii + (diff + qtd))!
            }
            
            let char = Character(uni)
            response += String(char)
        } else {
            response += String(list[index])
        }
    }
    
    return response
}

func replaceByComplement(_ text: String) -> String {
    let complement = 9
    
    var response = ""
    let list = text.map { $0 }
    
    for index in 0..<list.count {
        if list[index].isNumber {
            let num = Int(String(list[index]))
            
            response += String(complement - num!)
        } else {
            response += String(list[index])
        }
    }
    
    return response
}

func upperAndLowerText(_ text: String) -> String {
    var response = ""
    let list = text.map { $0 }
    
    for index in 0..<list.count {
        response += index.isMultiple(of: 2)
        ? list[index].uppercased()
        : list[index].lowercased()
    }
    
    return response
}


//print(upperAndLowerText("CPSO JO 7984!"))
//print(replaceByComplement("BORN IN 2015"))
//print(shift("BORN IN 2015", qtd: 1))
print(playPass("BORN IN 2015!", 1))
