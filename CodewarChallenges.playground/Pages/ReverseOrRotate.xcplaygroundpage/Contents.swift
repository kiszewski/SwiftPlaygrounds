import UIKit

func revRot(_ s: String, _ c: Int) -> String {
    var result = ""
    let chunks = chunksFromString(s, c)
    
    if chunks.isEmpty {
        return ""
    }
    
    for chunk in chunks {
        if shouldReverse(chunk) {
            result += reverse(chunk)
        } else {
            result += rotate(chunk)
        }
    }
    
    return result
}

func rotate(_ text: String) -> String {
    var copy = text
    
    copy.removeFirst()
    copy.append(text.first!.lowercased())
    
    return copy
}

func reverse(_ text: String) -> String {
    let reversed = text.reversed()
    
    return String(reversed)
}

func chunksFromString(_ text: String, _ size: Int) -> [String] {
    if size == 0 {
        return []
    }

    var response: [String] = []
    let chunksQtd: Int = text.count / size
    
    if chunksQtd < 1 {
        return []
    }
    
    for count in 1...chunksQtd {
        let after = (count - 1) * size
        let before = count * size
        
        let start = text.index(text.startIndex, offsetBy: after)
        let end = text.index(text.endIndex, offsetBy: before - text.count)
        let range = start..<end

        let mySubstring = text[range]
        
        response.append(String(mySubstring))
    }
    
    return response
}

func shouldReverse(_ text: String) -> Bool {
    let numbers = text.map({ t in
        Int(t.lowercased())
    })
    
    let sum = numbers.reduce(0) { partialResult, value in
        partialResult + value!
    }
    
    return sum.isMultiple(of: 2)
}


print(revRot("12345", 6)) //"234561876549"
