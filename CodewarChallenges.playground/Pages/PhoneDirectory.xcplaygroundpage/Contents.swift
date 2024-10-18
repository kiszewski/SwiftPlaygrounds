import Foundation

func phone(_ str: String, _ num: String) -> String {
    var allRegisters = [Register]()
    
    let rawRegisters = str.split(separator: "\n")
    
    for v in rawRegisters {
        allRegisters.append(Register(String(v)))
    }
    
    let filtered = allRegisters.filter { elem in
        elem.phone == num
    }
    
    if filtered.isEmpty {
        return "Error => Not found: \(num)"
    }
    
    if filtered.count > 1 {
        return "Error => Too many people: \(num)"
    }
    
    return filtered.first!.toString()
}

struct Register {
    let name: String
    let address: String
    let phone: String
    
    init(_ s: String) {
        var copy = s
        var startName = s.firstIndex(of: "<")!
        var endName = s.firstIndex(of: ">")!
        
        var startPhone = s.firstIndex(of: "+")!
        let isDoubleDigit = s[s.index(startPhone, offsetBy: 2)].isNumber
        let endPhone = s.index(startPhone, offsetBy: isDoubleDigit ? 15 : 14)

        copy.removeSubrange(startPhone...endPhone)
        copy.removeSubrange(copy.firstIndex(of: "<")!...copy.firstIndex(of: ">")!)
        
        var temp = ""
        
        for c in copy {
            if c.isLetter || c.isNumber || c == "," || c == "." || c == " " || c == "-" {
                temp += String(c)
            } else if c == "_"  {
                temp += " "
            }
        }
        
        address = temp.trimmingCharacters(in: [" "])
            .split(separator: " ")
            .map { v in
                v.trimmingCharacters(in: [" "])
            }
            .joined(separator: " ")
    
        
        startPhone = s.index(after: startPhone)
        startName = s.index(after: startName)
        endName = s.index(before: endName)
        
        let rangeName = startName...endName
        let rangePhone = startPhone...endPhone
        name = String(s[rangeName])
        phone = String(s[rangePhone])
        
    }
    
    func toString() -> String {
        "Phone => \(phone), Name => \(name), Address => \(address)"
    }
}
let s = "/+12-541-754-3010 156 Alphand_St. <J Steeve>\n 133, Green, Rd. <E Kustur> NY-56423 ;+1-541-914-3010!\n<Anastasia> +48-421-674-8974 Via Quirinal Roma\n <Peter O'Brien> High Street +1-908-512-2222; CC-47209\n"
print(phone(s, "1-908-512-2222"))


("Phone => 1-541-914-3010, Name => E Kustur, Address => 133, Green, Rd. NY-56423")
("Phone => 1-541-914-3010, Name => E Kustur, Address => 133 Green Rd. NY-56423")
