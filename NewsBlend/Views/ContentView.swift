//
//  ContentView.swift
//  NewsBlend
//
//  Created by Suraj Chodankar on 15/8/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var showSplashScreen = true

    var body: some View {
        ZStack {
            if showSplashScreen {
                SplashScreenView()
                    .transition(.opacity)
            } else {
                TabBarView()
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                withAnimation {
                    showSplashScreen = false
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
