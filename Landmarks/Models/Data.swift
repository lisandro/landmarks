//
//  Data.swift
//  Landmarks
//
//  Created by Lisandro Falconi on 28/03/2020.
//  Copyright © 2020 Lisandro Falconi. All rights reserved.
//

import UIKit
import SwiftUI
import CoreLocation

let landmarkData: [Landmark] = load("landmarkData.json")
let hikeData: [Hike] = load("hikeData.json")
let features = landmarkData.filter { $0.isFeatured }

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data

    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
        else {
            fatalError("Couldn't find \(filename) in main bundle.")
    }

    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }

    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
