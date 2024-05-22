import SwiftUI

struct FlexNHSBloodPressureView: View {
    @State private var graphWidth: Double = 0
    @State private var graphHeight: Double = 0

    var body: some View {
        Grid {
            GridRow {
                YAxisLayout(percentAxisPoints: [0.0, 30.0, 50.0, 80.0, 100.0]) {
                    /// YAxis systolic
                    Text("170")
                    Text("135")
                    Text("120")
                    Text("90")
                    Text("70")
                }

                GeometryReader { geometryProxy in
                    graphWidth = geometryProxy.size.width
                    graphHeight = geometryProxy.size.height
                    return ZStack {
                        /// Main graph display area
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(.blue)
                }
            }
            GridRow {
                Spacer()
                XAxisLayout(percentAxisPoints: [0.0, 20 / 60 * 100, 40 / 60 * 100, 45 / 60 * 100, 100]) { /// X-Axis diastolic
                    Text("40")
                    Text("60")
                    Text("80")
                    Text("85")
                    Text("100")
                }
                .frame(maxWidth: .infinity)
                .background(.red)
            }

        }.frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.green)
    }
}

#Preview {
    FlexNHSBloodPressureView()
}
