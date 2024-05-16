//
//  CardAccount.swift
//  LoginSystemSwiftUI
//
//  Created by Bayu Alif Farisqi on 16/05/24.
//

import SwiftUI

struct CardAccount: View {
    var initialName: String
    var fullName : String
    var emailAddress: String
    var isEmailVerified: Bool
    var body: some View {
        HStack {
            Text(initialName)
                .font(.title)
                .fontWeight(.semibold)
                .foregroundStyle(.mySecond)
                .frame(width: 72, height: 72)
                .background(Color(.white))
                .clipShape(Circle())
            VStack(alignment: .leading, spacing: 6) {
                HStack{
                    Text(fullName)
                        .font(.headline)
                        .fontWeight(.semibold)
                        .padding(.top, 4)
                        .foregroundStyle(.white)
                    Spacer()
                    Text(isEmailVerified ? "Verify" : "Not Verify")
                        .font(.footnote)
                        .bold()
                        .foregroundStyle(isEmailVerified ? .mySecond : .red)
                        .padding(.horizontal, 12)
                        .padding(.vertical, 4)
                        .background(
                            Capsule()
                                .fill(.white)
                        )
                }
                Text(emailAddress)
                    .font(.footnote)
                    .accentColor(.white)
                    .foregroundStyle(.white)
            }
            
            
        }
        .padding()
        .background(
            LinearGradient(
                gradient: Gradient(
                    colors: [
                        Color(.myMain),
                        Color(.mySecond)
                    ]
                ),
                startPoint: .leading,
                endPoint: .bottomTrailing
            )
        )
        .cornerRadius(10)
    }
}

#Preview {
    CardAccount(initialName: "BA", fullName: "Bayu Alif", emailAddress: "Bayu@gmail.com", isEmailVerified: true)
}
