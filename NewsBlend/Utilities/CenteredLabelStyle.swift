//
//  CenteredLabelStyle.swift
//  NewsBlend
//
//  Created by Abdullah Jaswal on 3/10/2024.
//

import SwiftUI

struct CenteredLabelStyle: LabelStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            configuration.icon
            configuration.title
        }
    }
}
