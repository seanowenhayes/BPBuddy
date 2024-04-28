import Foundation
import SwiftData

let healthySystolic: UInt = 105
let healthyDiastolic: UInt = 70

extension AddReadingView {
    
    @Observable
    class ViewModel {
        var systolic: UInt
        var diastolic: UInt
        var modelContext: ModelContext
        var reading: Reading {
            Reading(
                time: Date.now,
                systolic: systolic,
                diastolic: diastolic
            )
        }

        static func lastReading(modelContext: ModelContext) throws -> Reading? {
            let fetchRequest = FetchDescriptor<Reading>(sortBy: [SortDescriptor(\.time, order: .reverse)])
            let models = try modelContext.fetch(fetchRequest)
            return models.first
        }

        func save() {
            modelContext.insert(
                Reading(
                    time: Date.now,
                    systolic: systolic,
                    diastolic: diastolic
                )
            )
        }

        init(modelContext: ModelContext) {
            self.modelContext = modelContext
            let lastReading = try? Self.lastReading(modelContext: modelContext)
            if let lastReading {
                self.systolic = lastReading.systolic
                self.diastolic = lastReading.diastolic
            } else {
                self.systolic = healthySystolic
                self.diastolic = healthyDiastolic
            }
        }
    }
}
