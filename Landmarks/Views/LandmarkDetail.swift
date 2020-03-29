//
//  ContentView.swift
//  Landmarks
//
//  Created by Lisandro Falconi on 28/03/2020.
//  Copyright © 2020 Lisandro Falconi. All rights reserved.
//

import SwiftUI

struct LandmarkDetail: View {
    @EnvironmentObject var userData: UserData
    /// The landmark object to show the details
    var landmark: Landmark

    var landmarkIndex: Int {
        userData.landmarks.firstIndex { $0.id == landmark.id }!
    }

    var body: some View {
        VStack {
            // Map
            MapView(coordinate: landmark.locationCoordinate)
                .frame(height: 300)
                .edgesIgnoringSafeArea(.top)

            // Image
            CircleImage(image: landmark.image)
                .padding(.bottom, -130.0)
                .offset(x: 0, y: -130.0)

            // Data
            VStack(alignment: .leading) {
                HStack {
                    Text(landmark.name).font(.title)
                    Button(action: {
                        self.userData.landmarks[self.landmarkIndex].isFavorite.toggle()
                    }) {
                        if self.userData.landmarks[self.landmarkIndex].isFavorite {
                            Image(systemName: "heart.fill")
                                .foregroundColor(.pink)
                                .animation(.default)
                        } else {
                            Image(systemName: "heart")
                                .foregroundColor(.gray)
                                .animation(.easeInOut)
                        }
                    }
                }
                HStack {
                    Text(landmark.park).font(.subheadline)
                    Spacer()
                    Text(landmark.state).font(.subheadline)

                }
            }
            .padding()
            Spacer()
        }
        .navigationBarTitle(Text(landmark.name), displayMode: .inline)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkDetail(landmark: landmarkData[0])
    }
}
