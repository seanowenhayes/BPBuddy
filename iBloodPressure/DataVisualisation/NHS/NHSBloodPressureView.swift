import SwiftUI

/// Displays a blood pressure record using a chart based on the current NHS (Health serice in the U.K.) app.
///
struct NHSBloodPressureView: View {
    let reading: Reading

    var body: some View {
        VStack {
            AxisText("Systolic")
                .foregroundColor(.secondary)
                .frame(width: 240, alignment: .leading)
                .offset(x: -35)
            ZStack(alignment: .bottomLeading) {
                BackgroundView()
                SystolicAxisView()
                DiastolicAxisView()
                ReadingIndicatorView(reading: reading)
            }
            .frame(width: 240, height: 200)
            .border(.black)
            AxisText("diastolic")
                .foregroundColor(.secondary)
                .offset(y: 10)
        }
        .padding(.leading, 40)
        .padding(.trailing, 20)
        .padding(.top, 3)
        .padding(.bottom, 10)
    }
}

#Preview("Example reading") {
    NHSBloodPressureView(reading: Reading.example)
}

#Preview("Very low") {
    NHSBloodPressureView(
        reading: Reading(time: Date.now, systolic: 0, diastolic: 0)
    )
}

#Preview("Very high") {
    NHSBloodPressureView(
        reading: Reading(
            time: Date.now, systolic: 9999, diastolic: 9999
        )
    )
}

#Preview("Min OK reading") {
    NHSBloodPressureView(
        reading: Reading(
            time: Date.now, systolic: 90, diastolic: 60
        )
    )
}

#Preview("Max OK reading") {
    NHSBloodPressureView(
        reading: Reading(
            time: Date.now, systolic: 120, diastolic: 80
        )
    )
}

#Preview("Max slightly raised reading") {
    NHSBloodPressureView(
        reading: Reading(
            time: Date.now, systolic: 135, diastolic: 85
        )
    )
}
