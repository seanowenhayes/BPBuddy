import Foundation
import SwiftData

@Model
class Reading {
    // when the reading was taken
    let time: Date
    // the high number
    let systolic: Int
    // the low number
    let diastolic: Int
    
    let pulse: Int
    
    init(time: Date, systolic: Int, diastolic: Int, pulse: Int) {
        self.time = time
        self.systolic = systolic
        self.diastolic = diastolic
        self.pulse = pulse
    }
    
    static func example() -> Reading {
        .init(time: Date.now, systolic: 105, diastolic: 70, pulse: 80)
    }
}
