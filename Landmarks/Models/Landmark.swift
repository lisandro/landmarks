//
//  Landmark.swift
//  Landmarks
//
//  Created by Lisandro Falconi on 28/03/2020.
//  Copyright © 2020 Lisandro Falconi. All rights reserved.
//

import SwiftUI
import CoreLocation

struct Landmark: Hashable, Codable, Identifiable {
    /// An indentifier for the landmark
    var id: Int
    /// The landmark name
    var name: String
    /// The name of the image asset
    fileprivate var imageName: String
    /// The landmark coordinates on the map
    fileprivate var coordinates: Coordinates
    /// The state where the landmark is located
    var state: String
    /// The park name
    var park: String
    /// The category to belong the landmark
    var category: Category
    /// Determine if the landmark is user's favorite
    var isFavorite: Bool

    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude)
    }

    enum Category: String, CaseIterable, Codable, Hashable {
        case featured = "Featured"
        case lakes = "Lakes"
        case rivers = "Rivers"
        case mountains = "Mountains"
    }
}

extension Landmark {
    var image: Image {
        ImageStore.shared.image(name: imageName)
    }
}

struct Coordinates: Hashable, Codable {
    var latitude: Double
    var longitude: Double
}
