//
//  ImageAuth.swift
//  LoginSystemSwiftUI
//
//  Created by Bayu Alif Farisqi on 16/05/24.
//

import SwiftUI

struct ImageAuth: View {
    var imageName : String
    var height: CGFloat
    var body: some View {
        Image(imageName)
            .resizable()
            .scaledToFill()
            .frame(width: 200, height: height)
            .padding(.vertical, .size(.s))
    }
}

#Preview {
    ImageAuth(imageName: "loginImage", height: 250)
}
