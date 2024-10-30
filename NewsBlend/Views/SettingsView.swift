//
//  SettingsView.swift
//  NewsBlend
//
//  Created by Suraj Chodankar on 31/8/2024.
//
import SwiftUI

struct SettingsView: View {
    @State private var isNotificationsEnabled: Bool
    @State private var selectedTheme: String
    @State private var selectedFontSize: String
    @State private var selectedFontType: String

    let themes = ["Light", "Dark", "System"]
    let fontSizes = ["Small", "Medium", "Large"]
    let fontTypes = ["System", "Serif", "Sans-serif"]

    @Environment(\.colorScheme) var colorScheme

    init(
        isNotificationsEnabled: Bool = true,
        selectedTheme: String = "System",
        selectedFontSize: String = "Medium",
        selectedFontType: String = "System"
    ) {
        self.isNotificationsEnabled = isNotificationsEnabled
        self.selectedFontSize = selectedFontSize
        self.selectedFontType = selectedFontType
        self.selectedTheme = selectedTheme
    }

    var body: some View {
        VStack(alignment: .leading) {
            Text("Settings")
                .bold()
                .font(.title)
                .padding(.leading, 20)

            Form {
                Section(header: Text("Notifications")) {
                    Toggle(isOn: $isNotificationsEnabled) {
                        Text("Enable Notifications")
                    }
                }

                Section(header: Text("Appearance")) {
                    HStack {
                        Picker("Theme", selection: $selectedTheme) {
                            ForEach(themes, id: \.self) { theme in
                                Text(theme)
                            }
                        }
                        .pickerStyle(SegmentedPickerStyle())
                    }

                    HStack {
                        Picker("Font Size", selection: $selectedFontSize) {
                            ForEach(fontSizes, id: \.self) {
                                Text($0)
                            }
                        }
                        .pickerStyle(SegmentedPickerStyle())
                    }

                    HStack {
                        Picker("Font Type", selection: $selectedFontType) {
                            ForEach(fontTypes, id: \.self) {
                                Text($0)
                            }
                        }
                        .pickerStyle(SegmentedPickerStyle())
                    }
                }

                Section(header: Text("About")) {
                    HStack {
                        Text("Version")
                        Spacer()
                        Text("1.0.0")
                    }
                    HStack {
                        Text("Developed by")
                        Spacer()

                        VStack {
                            Text("Suraj Chodankar")
                            Text("Abdullah Jaswal")
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    SettingsView()
}
