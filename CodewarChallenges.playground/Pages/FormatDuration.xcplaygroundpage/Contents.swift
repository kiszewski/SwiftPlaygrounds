import Foundation

func formatDuration(_ s: Int) -> String {
    if(s == 0) {
        return "now"
    }
    
    let secondsInAMinute = 60
    let secondsInAHour = 60 * secondsInAMinute
    let secondsInADay = 24 * secondsInAHour
    let secondsInAYear = 365 * secondsInADay
    
    var years = s / secondsInAYear
    var days = s % secondsInAYear / secondsInADay
    var hours = s % secondsInAYear % secondsInADay / secondsInAHour
    var minutes = s % secondsInAYear % secondsInADay % secondsInAHour / secondsInAMinute
    var seconds = s % secondsInAYear % secondsInADay % secondsInAHour % secondsInAMinute
    
    let labels: [String] = [
        formatYear(years),
        formatDay(days),
        formatHour(hours),
        formatMinute(minutes),
        formatSecond(seconds),
    ].map { text in if(text == nil) { return ""} else { return text! }
    }.filter { text in  !text.isEmpty }
    
    var text: String = ""
    
    for l in labels {
        text += l
        
        if(labels.count == 1 || labels.last == l) {
            break
        }
        
        let isBeforeLastOne = labels[labels.count - 2] == l
        
        if isBeforeLastOne  {
            text += " and "
        } else {
            text += ", "
        }
    }
    
    return text
}

func formatYear(_ y: Int) -> String? {
    if(y == 0) {
        return nil
    } else if(y == 1) {
        return "\(y) year"
    } else {
        return "\(y) years"
    }
}

func formatDay(_ d: Int) -> String? {
    if(d == 0) {
        return nil
    } else if(d == 1) {
        return "\(d) day"
    } else {
        return "\(d) days"
    }
}

func formatHour(_ h: Int) -> String? {
    if(h == 0) {
        return nil
    } else if(h == 1) {
        return "\(h) hour"
    } else {
        return "\(h) hours"
    }
}

func formatMinute(_ m: Int) -> String? {
    if(m == 0) {
        return nil
    } else if(m == 1) {
        return "\(m) minute"
    } else {
        return "\(m) minutes"
    }
}


func formatSecond(_ s: Int) -> String? {
    if(s == 0) {
        return nil
    } else if(s == 1) {
        return "\(s) second"
    } else {
        return "\(s) seconds"
    }
}

print(formatDuration(0))
print(formatDuration(3662))


