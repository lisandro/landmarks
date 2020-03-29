//
//  UserData.swift
//  Landmarks
//
//  Created by Lisandro Falconi on 28/03/2020.
//  Copyright © 2020 Lisandro Falconi. All rights reserved.
//

import SwiftUI
import Combine

final class UserData: ObservableObject {
    @Published var showFavoritesOnly = false
    @Published var landmarks = landmarkData
    @Published var profile = Profile.default
}
