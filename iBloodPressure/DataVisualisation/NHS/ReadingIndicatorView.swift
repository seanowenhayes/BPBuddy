//

import SwiftUI

struct ReadingIndicatorView: View {
    
    @Environment(\.accessibilityReduceMotion) var reduceMotion
    
    @State private var size = 10.0
    
    let reading: Reading
    
    private let viewModel: ViewModel
    
    var body: some View {
        Circle()
            .foregroundColor(.black)
            .frame(width: 7, height: 7)
            .overlay {
                Circle()
                    .stroke(.gray, lineWidth: 0.5)
                    .blur(radius: (size / 7) - 1)
                    .frame(width: size, height: size)
                    .animation(reduceMotion ? nil : .linear(duration: 0.9).repeatForever(autoreverses: false), value: size)
            }
            .position(viewModel.readingPosition())
            .onAppear {
                size = 25.0
            }
    }
    
    init(reading: Reading) {
        self.reading = reading
        viewModel = ViewModel(reading: reading)
    }
}

#Preview {
    ReadingIndicatorView(reading: Reading.example)
}
