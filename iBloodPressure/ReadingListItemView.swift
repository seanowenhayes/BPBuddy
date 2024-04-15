//

import SwiftUI

struct ReadingListItemView: View {
    
    private let reading: Reading
    
    var body: some View {
        HStack {
            Text(reading.timeFormatted)
                .frame(maxWidth: .infinity)
                .foregroundColor(.secondary)
            Text("\(reading.systolic)")
                .frame(maxWidth: .infinity)
                .foregroundColor(.systolic)
            Text("\(reading.diastolic)")
                .frame(maxWidth: .infinity)
                .foregroundColor(.diastolic)
            Text("\(reading.pulse)")
                .frame(maxWidth: .infinity)
                .foregroundColor(.pulse)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        
    }
    
    init(reading: Reading) {
        self.reading = reading
    }
}

#Preview {
    ReadingListItemView(reading: Reading.example)
}
