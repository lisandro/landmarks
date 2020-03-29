//
//  Hike.swift
//  Landmarks
//
//  Created by Lisandro Falconi on 29/03/2020.
//  Copyright © 2020 Lisandro Falconi. All rights reserved.
//

import SwiftUI

struct Hike: Codable, Hashable, Identifiable {
    /// Hike name
    var name: String
    /// Hike identifier
    var id: Int
    /// Hike distance
    var distance: Double
    /// Hike difficulty
    var difficulty: Int
    /// Hike observations
    var observations: [Observation]

    static var formatter = LengthFormatter()

    var distanceText: String {
        return Hike.formatter
            .string(fromValue: distance, unit: .kilometer)
    }

    struct Observation: Codable, Hashable {
        var distanceFromStart: Double

        var elevation: Range<Double>
        var pace: Range<Double>
        var heartRate: Range<Double>
    }
}
