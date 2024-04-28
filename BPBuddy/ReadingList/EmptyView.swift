//

import SwiftUI

struct EmptyView: View {
    
    @Environment(ContentView.ContentModel.self) private var contentModel
    
    var body: some View {
        ContentUnavailableView {
            Label("No blood pressure readings", systemImage: "bolt.heart")
        } description: {
            Text("Add a reading now...")
        } actions: {
            Button("Add", systemImage: "plus") {
                contentModel.showAddReading = true
            }
        }
    }
}

#Preview {
    @State var contentModel = ContentView.ContentModel()
    return EmptyView().environment(contentModel)
}
