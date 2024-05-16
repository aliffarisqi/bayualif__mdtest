//
//  ProvileView.swift
//  LoginSystemSwiftUI
//
//  Created by Bayu Alif Farisqi on 15/05/24.
//

import SwiftUI

struct ProvileView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    var body: some View {
        if let user = viewModel.currentUser{
            List{
                Section{
                    HStack{
                        Text(user.initials)
                            .font(.title)
                            .fontWeight(.semibold)
                            .foregroundStyle(.white)
                            .frame(width: 72, height: 72)
                            .background(Color(.systemGray))
                            .clipShape(Circle())
                        VStack(alignment: .leading, spacing: 4){
                            Text(user.fullName)
                                .font(.subheadline)
                                .fontWeight(.semibold)
                                .padding(.top,4)
                            Text(user.email)
                                .font(.footnote)
                                .accentColor(.gray)
                            
                        }
                    }
                }
                Section("General"){
                    HStack{
                        SettingRowView(
                            imageName: "gear",
                            title: "Version",
                            tintColor: Color(
                                .systemGray
                            )
                        )
                        Spacer()
                        Text("1.0.0")
                            .font(.subheadline)
                            .foregroundStyle(.gray)
                    }
                }
                Section("Account"){
                    Button{
                        viewModel.signOut()
                    }label: {
                        SettingRowView(
                            imageName: "arrow.left.circle.fill",
                            title: "Sign Out",
                            tintColor: Color(
                                .red
                            )
                        )
                    }
                    Button{
                        print("Delete Account")
                    }label: {
                        SettingRowView(
                            imageName: "xmark.circle.fill",
                            title: "Delete Account",
                            tintColor: Color(
                                .red
                            )
                        )
                    }
                }
            }
        }
    }
}

#Preview {
    ProvileView()
}
