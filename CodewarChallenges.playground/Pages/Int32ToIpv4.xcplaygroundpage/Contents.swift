func ipv4(of i32: UInt32) -> String {
    let binary = String(i32, radix: 2)
    
    let binarySplited = binary.splitIPV4()
    
   return binarySplited.map({ v in
        String(Int(v, radix: 2)!)
    }).joined(separator: ".")
}

extension String {
    func splitIPV4() -> [Self] {
        var this = ""
        let maxLength = 32
        var response = [Self]()
        
        if maxLength > self.count {
            let diff = maxLength - self.count
            
            for _ in 0..<diff { this += "0" }
        }
        
        this += self
        
        var list = this.map { String($0) }
        
        for i in 0..<4 {
            let start = i * 8
            let end = start + 8
            var s = ""
            
            for index in start..<end {
                s += String(list[index])
            }
            
            response.append(s)
        }
        
        return response
    }
}

//print(ipv4(of: 2149583361))
//print(ipv4(of: 32))
print(ipv4(of: 1285885174)) //76.165.12.246 //01001100 10100101 00001100 11110110
