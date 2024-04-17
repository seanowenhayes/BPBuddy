import SwiftUI

/// Displays a blood pressure record using a chart based on the current NHS (Health serice in the U.K.) app.
///
struct NHSBloodPressureView: View {
    @State private var size = 7.0

    private var viewModel: ViewModel

    private let systolicYMarkings = [70.0, 90.0, 120.0, 135.0, 170.0]

    var body: some View {
        ZStack(alignment: .bottomLeading) {
            Rectangle().fill(.red.gradient)
            Rectangle().fill(.yellow.gradient)
                .frame(width: 180, height: 130)
            Rectangle().fill(.green.gradient)
                .frame(width: 160, height: 100)
            Rectangle().fill(.blue.gradient)
                .frame(width: 80, height: 40)
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

            Circle()
                .foregroundColor(.black)
                .frame(width: 7, height: 7)
                .overlay {
                    Circle()
                        .stroke(.gray, lineWidth: 0.5)
                        .blur(radius: (size / 7) - 1)
                        .frame(width: size, height: size)
                        .animation(.linear(duration: 0.9).repeatForever(autoreverses: false), value: size)
                }
                .position(viewModel.readingPosition())
        }
        .frame(width: 240, height: 200)
        .border(.black)
        .onAppear {
            size = 25.0
        }
    }

    init(reading: Reading) {
        viewModel = ViewModel(reading: reading)
    }
}

#Preview("Example reading") {
    NHSBloodPressureView(reading: Reading.example)
}

#Preview("Very low") {
    NHSBloodPressureView(
        reading: Reading(time: Date.now, systolic: 0, diastolic: 0, pulse: 0)
    )
}

#Preview("Very high") {
    NHSBloodPressureView(
        reading: Reading(
            time: Date.now, systolic: 9999, diastolic: 9999, pulse: 99999
        )
    )
}

#Preview("Min OK reading") {
    NHSBloodPressureView(
        reading: Reading(
            time: Date.now, systolic: 90, diastolic: 60, pulse: 99999
        )
    )
}

#Preview("Max OK reading") {
    NHSBloodPressureView(
        reading: Reading(
            time: Date.now, systolic: 120, diastolic: 80, pulse: 99999
        )
    )
}

#Preview("Max slightly raised reading") {
    NHSBloodPressureView(
        reading: Reading(
            time: Date.now, systolic: 135, diastolic: 85, pulse: 99999
        )
    )
}
