import Foundation

import SwiftUI


struct XAxisLayout: Layout {
    
    let percentAxisPoints: [Double]

    /// Give back the max text width as width and take up all height :)
    func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) -> CGSize {
        let maxHeight = subviews.map { $0.sizeThatFits(proposal) }.map { $0.height }.max()
        let size = ProposedViewSize(width: proposal.width, height: maxHeight)
        return size.replacingUnspecifiedDimensions()
    }

    func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) {
        for (index, subview) in subviews.enumerated() {
            let pointPlacement = percentAxisPoints[index]
            let pointX = (pointPlacement / 100.0) * bounds.size.width
            let point = CGPoint(x: pointX, y: 0)
            subview.place(at: point, anchor: .zero, proposal: .unspecified)
        }
    }
    
    
}
