//

import SwiftUI

struct ReadingListItemView: View {
    let reading: Reading

    var body: some View {
        GeometryReader { geometry in
            let aQuarterWidth = geometry.size.width / 4
            HStack {
                Text(reading.timeFormatted)
                    .frame(width: aQuarterWidth)
                Text("\(reading.systolic)")
                    .frame(width: aQuarterWidth)
                    .foregroundColor(.secondary)
                Text("\(reading.diastolic)")
                    .frame(width: aQuarterWidth)
                    .foregroundColor(.secondary)
                HStack {
                    HealthStatusView(healthStatus: reading.healthStatus)
                }.frame(width: aQuarterWidth)
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }

}

#Preview {
    ReadingListItemView(reading: Reading.example)
}
