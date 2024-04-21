//

import SwiftUI

struct DiastolicAxisView: View {
    private let bottom = 210.0
    var body: some View {
        AxisText("40")
            .position(x: 0, y: bottom)
        AxisText("60")
            .position(x: 80, y: bottom)
        AxisText("80")
            .position(x: 160, y: bottom)
        AxisText("85")
            .position(x: 180, y: bottom)
        AxisText("100")
            .position(x: 240, y: bottom)
    }
}

#Preview {
    DiastolicAxisView()
}
