import SwiftData
import SwiftUI

struct AddReadingView: View {
    @State private var model: ViewModel
    @Environment(\.dismiss) var dismiss
    var body: some View {
        VStack {
            Form {
                Section {
                    NHSBloodPressureView(reading: model.reading)
                }
                Section("Readings") {
                    Stepper("Systolic: \(model.systolic)", value: $model.systolic, in: 70 ... 170)
                    Stepper("Diastolic: \(model.diastolic)", value: $model.diastolic, in: 40 ... 100)
                    Stepper("Pulse: \(model.pulse)", value: $model.pulse, in: 20 ... 200)
                }
                Section("Record reading") {
                    Button("Add", systemImage: "plus.circle") {
                        model.save()
                        dismiss()
                    }
                    .frame(maxWidth: .infinity)
                }
            }.scrollBounceBehavior(.basedOnSize)
        }
    }

    init(modelContext: ModelContext) {
        let model = ViewModel(systolic: 105, diastolic: 70, pulse: 80, modelContext: modelContext)
        _model = State(initialValue: model)
    }
}

#Preview {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let modelContainer = try ModelContainer(for: Reading.self, configurations: config)
        return AddReadingView(modelContext: modelContainer.mainContext)
    } catch {
        return Text(error.localizedDescription)
    }
}
