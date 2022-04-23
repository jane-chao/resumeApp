//
//  DotLineShape.swift
//  MyResume
//
//  Created by Jane Chao on 22/04/22.
//

import SwiftUI

struct DotLineShape: Shape {
    enum LineStyle { case bottomHalf, full, topHalf }
    
    var lineWidth: CGFloat = 10
    var dotSize: CGFloat = 30
    var style: LineStyle = .full
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.addEllipse(in: CGRect(x: rect.midX - dotSize / 2,
                                   y: rect.midY - dotSize / 2,
                                   width: dotSize,
                                   height: dotSize))
        path.addRect(CGRect(x: rect.midX - (lineWidth / 2),
                            y: style == .bottomHalf ? rect.midY : rect.minY,
                            width: lineWidth,
                            height: style == .full ? rect.height : rect.height / 2))

        return path
    }
    
}


struct DotLineShape_Previews: PreviewProvider {
    static var previews: some View {
        VStack (spacing: 0) {
            DotLineShape(style: .bottomHalf).background(.yellow)
            DotLineShape().background(.blue)
            DotLineShape(style: .topHalf).background(.yellow)
        }.frame(height: 300)
    }
}
