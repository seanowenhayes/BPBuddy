import SwiftData
import SwiftUI

struct ReadingListView: View {
    @Environment(\.modelContext) var modelContext

    @Query var readings: [Reading]
    var body: some View {
        VStack {
            if readings.isEmpty == false {
                List {
                    ForEach(readings) { reading in
                        ReadingListItemView(reading: reading)
                            .swipeActions(edge: .leading) {
                                Button("Edit", systemImage: "pencil") {
                                }
                            }
                    }.onDelete(perform: deleteRecords)

                }.scrollBounceBehavior(.basedOnSize)

            } else {
                EmptyView()
            }
        }
    }

    func deleteRecords(indexSet: IndexSet) {
        indexSet.forEach { index in
            modelContext.delete(readings[index])
        }
    }
}

#Preview {
    @State var showAddReadingView = false
    @State var reading: Reading? = Reading.example
    let contentModel = ContentView.ContentModel()
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let modelContainer = try ModelContainer(for: Reading.self, configurations: config)
        let modelContext = modelContainer.mainContext

        Array(repeating: Reading.example, count: 10).forEach {
            print($0)
            modelContext.insert($0)
        }

        return ReadingListView()
            .modelContext(modelContext)
            .environment(contentModel)
    } catch {
        return Text(error.localizedDescription)
    }
}
