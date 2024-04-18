import Foundation
import SwiftData

@Model
class Reading {
    // when the reading was taken
    let time: Date
    // the high number
    var systolic: UInt
    // the low number
    var diastolic: UInt

    var pulse: UInt
    
    var timeFormatted: String {
        time.formatted(.dateTime.day(.twoDigits).month(.twoDigits).year(.twoDigits))
    }

    init(time: Date, systolic: UInt, diastolic: UInt, pulse: UInt) {
        self.time = time
        self.systolic = systolic
        self.diastolic = diastolic
        self.pulse = pulse
    }

    static let example = Reading(time: Date.now, systolic: 105, diastolic: 70, pulse: 80)
}
