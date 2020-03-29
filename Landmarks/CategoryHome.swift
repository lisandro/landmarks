//
//  CategoryHome.swift
//  Landmarks
//
//  Created by Lisandro Falconi on 29/03/2020.
//  Copyright © 2020 Lisandro Falconi. All rights reserved.
//

import SwiftUI

struct CategoryHome: View {
    var categories: [String: [Landmark]] {
        Dictionary(grouping: landmarkData, by: { $0.category.rawValue })
    }

    var featured: [Landmark] {
        landmarkData.filter(\.isFeatured) // Swift 5.2 --> filter(\.isFeatured)
    }

    var body: some View {
        NavigationView {
            List {
                FeaturedLandmarks(landmarks: featured)
                    .scaledToFill()
                    .frame(height: 200.0)
                    .clipped() // By default, a view’s bounding frame is used only for layout, so any content that extends beyond the edges of the frame is still visible. Use the clipped(antialiased:)modifier to hide any content that extends beyond these edges.
                    .listRowInsets(EdgeInsets())
                ForEach(categories.keys.sorted(), id: \.self) { key in
                    CategoryRow(categoryName: key, items: self.categories[key]!)
                }
                .listRowInsets(EdgeInsets())
            }
            .navigationBarTitle(Text("Featured"))
        }
    }
}

struct FeaturedLandmarks: View {
    var landmarks: [Landmark]
    var body: some View {
        landmarks[0].image.resizable()
    }
}

struct CategoryHome_Previews: PreviewProvider {
    static var previews: some View {
        CategoryHome()
    }
}
