import Foundation
import SwiftData

extension AddReadingView {
    @Observable
    class ViewModel {
        var  systolic: Int
        var diastolic: Int
        var pulse: Int
        var modelContext: ModelContext
        
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
        
        init(systolic: Int, diastolic: Int, pulse: Int, modelContext: ModelContext) {
            self.systolic = systolic
            self.diastolic = diastolic
            self.pulse = pulse
            self.modelContext = modelContext
        }
    }
}
