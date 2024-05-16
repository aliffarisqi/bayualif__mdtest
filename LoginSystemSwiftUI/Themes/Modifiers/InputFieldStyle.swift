//
//  InputField.swift
//  LoginSystemSwiftUI
//
//  Created by Bayu Alif Farisqi on 16/05/24.
//

import SwiftUI

struct InputFieldStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .background(.purpleLight)
            .clipShape(
                RoundedRectangle(
                    cornerSize: CGSize(
                        width: 50,
                        height: 50
                    )
                )
            )
            .foregroundStyle(Color.black)
            .font(.system(size: .size(.l)))
    }
}

extension View {
    func inputFieldStyle() -> some View {
        modifier(InputFieldStyle())
    }
}

