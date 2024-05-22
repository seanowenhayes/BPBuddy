import SwiftUI

enum AxisLayouError: Error {
    case overMax100
    case underMin0
}

struct YAxisLayout: Layout {
    
    let percentAxisPoints: [Double]

    /// Give back the max text width as width and take up all height :)
    func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) -> CGSize {
        let maxWidth = subviews.map { $0.sizeThatFits(proposal) }.map { $0.width }.max()
        let size = ProposedViewSize(width: maxWidth, height: proposal.height)
        return size.replacingUnspecifiedDimensions()
    }

    func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) {
        for (index, subview) in subviews.enumerated() {
            let pointPlacement = percentAxisPoints[index]
            let pointY = (pointPlacement / 100.0) * bounds.size.height
            let point = CGPoint(x: 0, y: pointY)
            subview.place(at: point, anchor: .zero, proposal: .unspecified)
        }
    }
    
    
}
