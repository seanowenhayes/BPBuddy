import SwiftData
import SwiftUI

struct ReadingTableView: View {
    
    @Query(sort: \Reading.time, order: .reverse) var readings: [Reading]
    var body: some View {
        Table(readings) {
            TableColumn("When", value: \.timeFormatted)
            TableColumn("Diastolic", value: \.diastolicFormatted)
            TableColumn("Systolic", value: \.systolicFormatted)
        }
    }
}

#Preview {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let modelContainer = try ModelContainer(for: Reading.self, configurations: config)
        let modelContext = modelContainer.mainContext
        modelContext.insert(Reading.example)
        modelContext.insert(Reading.example)
        modelContext.insert(Reading.example)
        modelContext.insert(Reading.example)
        return ReadingTableView()
            .modelContext(modelContext)
    } catch {
        return Text(error.localizedDescription)
    }
    
    
}
