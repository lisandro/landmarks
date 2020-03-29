//
//  BadgeSymbol.swift
//  Landmarks
//
//  Created by Lisandro Falconi on 29/03/2020.
//  Copyright © 2020 Lisandro Falconi. All rights reserved.
//

import SwiftUI

struct BadgeSymbol: View {
    static let symbolColor = Color(red: 79.0 / 255, green: 79.0 / 255, blue: 191.0 / 255)

    var body: some View {
        GeometryReader { geometry in
            Path { path in
                let width = min(geometry.size.width, geometry.size.height)
                let height = width * 0.75 // The height of the shape relative to width

                let spacing = width * 0.030

                let middle = width / 2

                let topWidth = 0.226 * width
                let topHeight = 0.488 * height

                // Snowcap peak triangle
                path.addLines([
                    CGPoint(x: middle, y: spacing),
                    CGPoint(x: middle - topWidth, y: topHeight - spacing),
                    CGPoint(x: middle, y: topHeight / 2 + spacing), // Left wing of the snowcap
                    CGPoint(x: middle + topWidth, y: topHeight - spacing), // Right wing of the snowcap
                    CGPoint(x: middle, y: spacing)
                ])

                let startYpoint = topHeight / 2 + spacing * 3
                path.move(to: .init(x: middle, y: startYpoint)) // Move to the starting poing of new shape

                let maxY = height - spacing
                let minY = topHeight + spacing
                let minX = width - spacing
                path.addLines([
                    CGPoint(x: middle - topWidth, y: minY),
                    CGPoint(x: spacing, y: maxY),
                    CGPoint(x: minX, y: maxY),
                    CGPoint(x: middle + topWidth, y: minY),
                    CGPoint(x: middle, y: startYpoint)
                ])
            }
            .fill(Self.symbolColor)
        }
    }
}

struct BadgeSymbol_Previews: PreviewProvider {
    static var previews: some View {
        BadgeSymbol()
    }
}
