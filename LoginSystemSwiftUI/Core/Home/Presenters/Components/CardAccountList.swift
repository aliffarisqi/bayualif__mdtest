//
//  CardAccountList.swift
//  LoginSystemSwiftUI
//
//  Created by Bayu Alif Farisqi on 17/05/24.
//

import SwiftUI

struct CardAccountList: View {
    var initialName: String
    var fullName : String
    var emailAddress: String
    var isEmailVerified: Bool
    
    var body: some View {
        HStack {
            Text(initialName)
                .font(.system(size: .size(.l)))
                .fontWeight(.semibold)
                .foregroundStyle(.white)
                .frame(width: 45, height: 45)
                .background(Color(.textMain))
                .clipShape(RoundedRectangle(cornerRadius: 10))
            VStack(alignment: .leading, spacing: 6) {
                HStack{
                    VStack(alignment: .leading){
                        Text(fullName)
                            .font(.subheadline)
                            .padding(.top, 4)
                            .foregroundStyle(.black.opacity(0.8))
                        Text(emailAddress)
                            .font(.footnote)
                            .accentColor(.gray)
                            .foregroundStyle(.gray)
                            .fontWeight(.light)
                    }
                    Spacer()
                    Text(isEmailVerified ? "Verify" : "Not Verify")
                        .font(.footnote)
                        .font(.system(size: .size(.xs)))
                        .foregroundStyle(isEmailVerified ? .mySecond : .red)
                        .padding(.horizontal, 8)
                        .padding(.vertical, 3)
                        .background(
                            Capsule()
                                .fill(.white)
                        )
                        .background(
                            Capsule()
                                .stroke(isEmailVerified ? .mySecond : .red, lineWidth: 1.0)
                        )
                }
            }
        }
    }
}

#Preview {
    CardAccountList(initialName: "BY", fullName: "Bayu Alif", emailAddress: "Bayu@gmail.com", isEmailVerified: true)
}
