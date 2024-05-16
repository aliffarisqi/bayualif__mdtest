//
//  ButtonSubmit.swift
//  LoginSystemSwiftUI
//
//  Created by Bayu Alif Farisqi on 16/05/24.
//

import SwiftUI

struct ButtonSubmit: View {
    var title: String
    var isLoading: Bool = false
    var isFormValidation : Bool = false
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack {
                if isLoading {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle())
                        .tint(.white)
                } else {
                    Text(title)
                        .fontWeight(.bold)
                    Image(systemName: SFSymbol.rightArrow)
                }
            }
            .foregroundStyle(.white)
            .padding()
            .frame(width: UIScreen.main.bounds.width - 32)
            .background(
                LinearGradient(
                    gradient: Gradient(
                        colors: [
                            Color(.myMain),
                            !isFormValidation ? Color(.myMain).opacity(0.7) : Color(.mySecond)
                            
                        ]
                    ),
                    startPoint: .leading,
                    endPoint: .bottomTrailing
                )
            )
            .cornerRadius(.infinity)
        }
    }
}

#Preview {
    ButtonSubmit(title: "SIGN IN", action: {})
}
