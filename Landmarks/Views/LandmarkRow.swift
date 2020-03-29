//
//  LandmarkRow.swift
//  Landmarks
//
//  Created by Lisandro Falconi on 28/03/2020.
//  Copyright © 2020 Lisandro Falconi. All rights reserved.
//

import SwiftUI

struct LandmarkRow: View {
    var landmark: Landmark

    var body: some View {
        HStack {
            landmark.image.resizable().frame(width: 50, height: 50) // Default alignment .center
            Text(landmark.name)
            Spacer()
        }
    }
}

struct LandmarkRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            LandmarkRow(landmark: landmarkData[1])
            LandmarkRow(landmark: landmarkData[2])
            LandmarkRow(landmark: landmarkData[3])
        }.previewLayout(.fixed(width: 300, height: 70))
    }
}