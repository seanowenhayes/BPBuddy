import Foundation

extension ReadingIndicatorView {
    
    @Observable
    class ViewModel {
        let reading: Reading
        
        init(reading: Reading) {
            self.reading = reading
        }
        
        private(set) var isAnimating = false
        
        func startAnimation() {
            isAnimating = true
        }
        
        func readingPosition() -> CGPoint {
            
            let minSystolic: Double = 70
            let maxSystolic: Double = 170
            let systolic = min(max(Double(reading.systolic), minSystolic), maxSystolic)
            
            
            let minDiastolic: Double = 40
            let maxDiastolic: Double = 100
            let diastolic = min(max(Double(reading.diastolic), minDiastolic), maxDiastolic)
            
            
            let height = 200.0
            let systolicToAxisRatio = height / (maxSystolic - minSystolic)
            let systolicPosition: Double = height - ((systolic - minSystolic) * systolicToAxisRatio)
            
            let width = 240.0
            let diastolicToAxisRatio = width / (maxDiastolic - minDiastolic)
            let diastolicPosition: Double = (diastolic - minDiastolic) * diastolicToAxisRatio
            
            return CGPoint(x: diastolicPosition, y: systolicPosition)
        }
    }
}
