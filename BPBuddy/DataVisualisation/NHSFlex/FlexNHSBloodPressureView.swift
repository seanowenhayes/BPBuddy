import SwiftUI

struct FlexNHSBloodPressureView: View {
    var body: some View {
        VStack {
            HStack {
                YAxisLayout(percentAxisPoints: [0.0, 30.0, 50.0, 80.0, 100.0]) {
                    /// YAxis systolic
                    Text("170")
                    Text("135")
                    Text("120")
                    Text("90")
                    Text("70")
                }
                ZStack {
                    /// Main graph display area
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(.blue)
            }
            XAxisLayout(percentAxisPoints: [0.0, 20 / 60 * 100, 40 / 60 * 100, 45 / 60 * 100, 100], paddingLeft: 25.0) { /// X-Axis diastolic
                Text("40")
                Text("60")
                Text("80")
                Text("85")
                Text("100")
            }
            .background(.red)
        }
    }
}

#Preview {
    FlexNHSBloodPressureView()
}
