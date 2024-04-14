import SwiftData
import SwiftUI

struct AddReadingView: View {
    @State private var model: ViewModel
    @Environment(\.dismiss) var dismiss
    var body: some View {
        VStack {
            Form {
                Section("Readings") {
                    Picker("Systolic", selection: $model.systolic) {
                        ForEach(70 ... 170, id: \.self) { value in
                            Text(String(value))
                        }
                    }
                    Picker("Diastolic", selection: $model.diastolic) {
                        ForEach(40 ... 100, id: \.self) { value in
                            Text(String(value))
                        }
                    }
                    Picker("Pulse", selection: $model.pulse) {
                        ForEach(20 ... 220, id: \.self) { value in
                            Text(String(value))
                        }
                    }
                }
                Section("Record reading") {
                    Button("Add", systemImage: "plus.circle") {
                        model.save()
                        dismiss()
                    }
                    .frame(maxWidth: .infinity)
                }
            }.scrollBounceBehavior(.basedOnSize)
            Image(.bloodPressureReading)
                .resizable()
                .scaledToFill()
                .ignoresSafeArea(.all)
        }
    }

    // systolic: 105, diastolic: 70, pulse: 80
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
