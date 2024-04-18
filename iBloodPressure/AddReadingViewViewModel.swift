import Foundation
import SwiftData

extension AddReadingView {
    @Observable
    class ViewModel {
        var  systolic: UInt
        var diastolic: UInt
        var pulse: UInt
        var modelContext: ModelContext
        var reading: Reading {
            Reading(
                time: Date.now,
                systolic: systolic,
                diastolic: diastolic,
                pulse: pulse
            )
        }
        
        func save() {
            modelContext.insert(
                Reading(
                    time: Date.now,
                    systolic: systolic,
                    diastolic: diastolic,
                    pulse: pulse
                )
            )
        }
        
        init(systolic: UInt, diastolic: UInt, pulse: UInt, modelContext: ModelContext) {
            self.systolic = systolic
            self.diastolic = diastolic
            self.pulse = pulse
            self.modelContext = modelContext
        }
    }
}
