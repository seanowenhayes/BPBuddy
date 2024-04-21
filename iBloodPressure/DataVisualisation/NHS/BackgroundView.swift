//

import SwiftUI

struct BackgroundView: View {
    var body: some View {
        Rectangle().fill(.red.gradient)
        Rectangle().fill(.yellow.gradient)
            .frame(width: 180, height: 130)
        Rectangle().fill(.green.gradient)
            .frame(width: 160, height: 100)
        Rectangle().fill(.blue.gradient)
            .frame(width: 80, height: 40)
    }
}

#Preview {
    BackgroundView()
}
