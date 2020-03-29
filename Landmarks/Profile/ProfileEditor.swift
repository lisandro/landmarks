//
//  ProfileEditor.swift
//  Landmarks
//
//  Created by Lisandro Falconi on 29/03/2020.
//  Copyright © 2020 Lisandro Falconi. All rights reserved.
//

import SwiftUI

struct ProfileEditor: View {
    @Binding var profile: Profile

    var dateRange: ClosedRange<Date> {
        let min = Calendar.current.date(byAdding: .year, value: -1, to: profile.goalDate)!
        let max = Calendar.current.date(byAdding: .year, value: 1, to: profile.goalDate)!
        return min...max
    }

    var body: some View {
        List {
            // Username
            HStack {
                Text("Username").bold()
                Divider()
                TextField("Username", text: $profile.username)
            }

            // Notifications
            Toggle(isOn: $profile.prefersNotifications) {
                Text("Enable Notifications")
            }

            // Seasonal photo
            VStack(alignment: .leading, spacing: 20.0) {
                Text("Seasonal Photo").bold()
                Picker("Seasonal Photo", selection: $profile.seasonalPhoto) {
                    ForEach(Profile.Season.allCases, id: \.self) { season in
                        Text(season.rawValue).tag(season)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
            }
            .padding(.top)

            // Goal date
            VStack(alignment: .leading, spacing: 20.0) {
                Text("Goal Date").bold()

                DatePicker("", selection: $profile.goalDate, in: dateRange, displayedComponents: .date)
            }
            .padding(.top)
        }
    }
}

struct ProfileEditor_Previews: PreviewProvider {
    static var previews: some View {
        ProfileEditor(profile: .constant(.default))
    }
}
