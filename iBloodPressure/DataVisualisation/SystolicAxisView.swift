//

import SwiftUI

struct SystolicAxisView: View {
    var body: some View {
        Text("170 -")
            .position(x: -20, y: 0)
        Text("135 -")
            .position(x: -20, y: 70)
        Text("120 -")
            .position(x: -20, y: 100)
        Text("90 -")
            .position(x: -20, y: 160)
        Text("70 -")
            .position(x: -20, y: 200)
    }
}

#Preview {
    SystolicAxisView()
}
