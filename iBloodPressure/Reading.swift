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

    var healthStatus: String {
        if systolic > 135 || diastolic > 85 {
            return "high"
        }
        if systolic > 120 || diastolic > 80 {
            return "raised"
        }
        if systolic > 90 || diastolic > 60 {
            return "healthy"
        }
        return "low"
    }

    init(time: Date, systolic: UInt, diastolic: UInt, pulse: UInt) {
        self.time = time
        self.systolic = systolic
        self.diastolic = diastolic
        self.pulse = pulse
    }

    static let example = Reading(time: Date.now, systolic: 105, diastolic: 70, pulse: 80)
}
