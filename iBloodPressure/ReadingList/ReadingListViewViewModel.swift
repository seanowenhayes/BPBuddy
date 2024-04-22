import Foundation

extension ReadingListItemView {
    @Observable
    class ViewModel {
        let reading: Reading
        
        init(reading: Reading) {
            self.reading = reading
        }
        
        func iconForReading() -> String {
            switch reading.healthStatus {
                case .low:
                    "arrow.down.heart"
                case .healthy:
                    "heart.circle"
                case .raised:
                    "arrow.up.heart"
                case .high:
                    "arrow.up.heart.fill"
            }
        }
    }
}
