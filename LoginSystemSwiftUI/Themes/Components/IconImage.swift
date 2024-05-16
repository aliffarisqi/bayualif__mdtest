//
//  IconImage.swift
//  LoginSystemSwiftUI
//
//  Created by Bayu Alif Farisqi on 16/05/24.
//

import SwiftUI

struct IconImage: View {
    var imageName : String
    var iconColor: Color
    var body: some View {
        Image(systemName: imageName)
            .imageScale(.large)
            .fontWeight(.bold)
            .foregroundStyle(iconColor)
    }
}

#Preview {
    IconImage(imageName: "checkmark.circle.fill", iconColor: .green)
}
