import Foundation
import SwiftData

@Model
class Reading {
    
    enum HealthStatus {
        case low
        case healthy
        case raised
        case high
    }
    
    // When the reading was taken
    let time: Date
    // The high number
    var systolic: UInt
    // The low number
    var diastolic: UInt

    var timeFormatted: String {
        time.formatted(.dateTime.day(.twoDigits).month(.twoDigits))
    }

    var healthStatus: HealthStatus {
        if systolic > 135 || diastolic > 85 {
            return .high
        }
        if systolic > 120 || diastolic > 80 {
            return .raised
        }
        if systolic > 90 || diastolic > 60 {
            return .healthy
        }
        return .low
    }

    init(time: Date, systolic: UInt, diastolic: UInt) {
        self.time = time
        self.systolic = systolic
        self.diastolic = diastolic
    }

    static let example = Reading(time: Date.now, systolic: 105, diastolic: 70)
}
