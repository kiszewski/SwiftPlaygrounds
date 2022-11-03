func stat(_ strg: String) -> String {
    var durations: [TimeDuration] = strg.split(separator: ",").map { element in
        return TimeDuration(time: String(element))
    }.sorted(by: {t1, t2 in t1.totalSeconds > t2.totalSeconds })

    return "Range: \(getRange(durations)) Average: \(getAverage(durations)) Median: \(getMedian(durations))"
}

func getRange(_ durations: [TimeDuration]) -> String {
    let lowest = durations.min(by: { t1, t2 in
        t1.totalSeconds < t2.totalSeconds
    })!

    let greatest = durations.min(by: { t1, t2 in
        t1.totalSeconds > t2.totalSeconds
    })!

    let secondsDiff = greatest.totalSeconds - lowest.totalSeconds
    return TimeDuration(totalSeconds: secondsDiff).time
}

func getAverage(_ durations: [TimeDuration]) -> String {
    var totalSeconds = 0

    for d in durations { totalSeconds += d.totalSeconds }
    
    let average = totalSeconds / durations.count
    
    return TimeDuration(totalSeconds: average).time
}

func getMedian(_ durations: [TimeDuration]) -> String {
    var response = ""
    
    let isEven = durations.count.isMultiple(of: 2)

    if isEven {
        let middle1 = Int(durations.count / 2)
        let middle2 = Int((durations.count / 2) - 1)
        
        let median = (durations[middle1].totalSeconds + durations[middle2].totalSeconds) / 2
        response = TimeDuration(totalSeconds: median).time
    } else {
        let middle = Int(durations.count / 2)
        response = durations[middle].time
    }
    
    return response
}

struct TimeDuration {
    let time: String
    let totalSeconds: Int
    
    init(time: String) {
        self.time = time
        
        let hourMinuteSecond = time.split(separator: "|", maxSplits: 3).map { s in
            Int(String(s))
        }
        
        let hour = hourMinuteSecond[0]
        let minute = hourMinuteSecond[1]
        let second = hourMinuteSecond[2]
        
        self.totalSeconds = (hour! * 60 * 60) + (minute! * 60) + second!
    }
    
    init(totalSeconds: Int) {
        self.totalSeconds = totalSeconds
        
        var totalHours = totalSeconds / 60 / 60
        let totalMinutes = totalSeconds / 60
        
        let minute = totalMinutes - (totalHours * 60)
        let second = totalSeconds - (totalMinutes * 60)
        
        let hoursString: String = totalHours < 10 ? "0\(totalHours)" : "\(totalHours)"
        let hoursMinute: String = minute < 10 ? "0\(minute)" : "\(minute)"
        let hoursSecond: String = second < 10 ? "0\(second)" : "\(second)"
        
        self.time = "\(hoursString)|\(hoursMinute)|\(hoursSecond)"
    }
}

//print(stat("01|15|59,01|47|16,01|17|20,01|32|34,02|17|17"))
//print(stat("02|15|59,02|47|16,02|17|20,02|32|34,02|17|17,02|22|00,02|31|41")) // sol = "Range: 00|31|17 Average: 02|26|18 Median: 02|22|00";
print(stat("02|15|59,02|47|16,02|17|20,02|32|34,02|32|34,02|17|17")) //"Range: 00|31|17 Average: 02|27|10 Median: 02|24|57";

