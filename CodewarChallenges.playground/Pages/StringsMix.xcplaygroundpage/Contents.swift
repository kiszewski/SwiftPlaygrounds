struct StringCount {
    let id: String   //1 or 2
    var lettersCounterDict: [String : Int]  //'r' appears n times
    
    init(_ id: String, _ value: String) {
        self.id = id
        self.lettersCounterDict = ["a": 0]
        
        for l in value {
            if l.isLowercase {
                let count = lettersCounterDict[String(l)]
                
                if count == nil {
                    lettersCounterDict[String(l)] = 1
                } else {
                    let v = Int(lettersCounterDict[String(l)]! + 1)

                    lettersCounterDict[String(l)] = v
                }
            }
        }
    }
}

func mix(_ s1: String, _ s2: String) -> String {
    let string1 = StringCount("1", s1)
    let string2 = StringCount("2", s2)
    
    return compare(s1: string1, s2: string2)
}

func compare(s1: StringCount, s2: StringCount) -> String {
    var response = [String]()
    var allLetters = [String]()
    
    for v in s1.lettersCounterDict { allLetters.append(v.key) }
    
    for v in s2.lettersCounterDict {
        if allLetters.contains(v.key) { continue }
        
        allLetters.append(v.key)
    }
    
    for key in allLetters {
        let v1 = s1.lettersCounterDict[key] ?? 0
        let v2 = s2.lettersCounterDict[key] ?? 0
        
        if v1 < 2 && v2 < 2 { continue }
        
        if v1 == v2 {
            response.append("E:\(multipleLetter(key, v1))")
            
            continue
        }
        
        if v1 > v2 {
            response.append("\(s1.id):\(multipleLetter(key, v1))")
        } else {
            response.append("\(s2.id):\(multipleLetter(key, v2))")
        }
    }

    return String(response.sorted(by: {v1, v2 in
        if v1.count == v2.count {
            
            if(v1.first! == v2.first!) {
                return v1.last! < v2.last!
            }
            
            return v1.first! < v2.first!
        }
        
        return v1.count > v2.count
    }).joined(separator: "/"))
}

func multipleLetter(_ letter: String, _ times: Int) -> String {
    var response = ""
    
    for _ in 0..<times { response += letter }
    
    return response
}

let s1 = "Are the kids at home? aaaaa fffff"
let s2 = "Yes they are here! aaaaa fffff"
//print(mix(s1, s2)) // "=:aaaaaa/2:eeeee/=:fffff/1:tt/2:rr/=:hh"

print(mix("Are they here", "yes, they are here")) //"2:eeeee/2:yy/E:hh/E:rr"
