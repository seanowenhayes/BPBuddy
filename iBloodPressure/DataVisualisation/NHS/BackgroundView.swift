import SwiftUI

struct BackgroundView: View {
    var body: some View {
        Rectangle().fill(Color.highBloodPressure)
        Rectangle().fill(Color.raisedBloodPressure)
            .frame(width: 180, height: 130)
        Rectangle().fill(Color.healthyBloodPressure)
            .frame(width: 160, height: 100)
        Rectangle().fill(Color.lowBloodPressure)
            .frame(width: 80, height: 40)
    }
}

#Preview {
    BackgroundView()
}
