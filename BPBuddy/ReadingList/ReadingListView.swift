import SwiftData
import SwiftUI

struct ReadingListView: View {
    @Environment(\.modelContext) var modelContext

    @Query(sort: \Reading.time, order: .reverse) var readings: [Reading]
    var body: some View {
        VStack {
            if readings.isEmpty == false {
                List {
                    GeometryReader { geometry in
                        let width = geometry.size.width
                        HStack {
                            Text("Date")
                                .frame(width: width * 0.24)
                                .fontWeight(.bold)
                            ViewThatFits {
                                Text("Systolic")
                                Text("Sys")
                            }
                            .frame(width: width * 0.24)
                                .fontWeight(.bold)
                            ViewThatFits {
                                Text("Diastolic")
                                Text("Dia")
                            }
                            .frame(width: width * 0.24)
                                .fontWeight(.bold)
                            Text("Status")
                                .frame(width: width * 0.28)
                                .fontWeight(.bold)
                        }
                    }
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

        for i in 0 ... 10 {
            let example = Reading.example
            example.diastolic += UInt(i)
            example.systolic += UInt(i)
            modelContext.insert(example)
        }
        return ReadingListView()
            .modelContext(modelContext)
            .environment(contentModel)
    } catch {
        return Text(error.localizedDescription)
    }
}
