import SwiftData
import SwiftUI

@main
struct iBloodPressureApp: App {
    let container: ModelContainer
    var body: some Scene {
        WindowGroup {
            ContentView(
                modelContext: container.mainContext
            ).modelContext(container.mainContext)
        }
    }
    
    init() {
        do {
            container = try ModelContainer(for: Reading.self)
        } catch {
            fatalError("Failed to create ModelContainer fror Reading. \(error.localizedDescription)")
        }
    }
}
