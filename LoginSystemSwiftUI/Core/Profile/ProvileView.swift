//
//  ProvileView.swift
//  LoginSystemSwiftUI
//
//  Created by Bayu Alif Farisqi on 15/05/24.
//

import SwiftUI

struct ProvileView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    @State private var selectedFilter = 0
    @State private var searchText = ""
    
    var filteredUsers: [User] {
        let filteredUsers = selectedFilter == 0 ? viewModel.allUsers : (selectedFilter == 1 ? viewModel.allUsers.filter {
            $0.isEmailVerified
        } : viewModel.allUsers.filter {
            !$0.isEmailVerified
        })
        
        if searchText.isEmpty {
            return filteredUsers
        } else {
            return filterUsersByKeyword(searchText: searchText)
        }
    }
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
                            Text(user.isEmailVerified ? "Verify" : "Not Verify")
                                .font(.footnote)
                                .foregroundStyle(user.isEmailVerified ? .blue : .red)
                        }
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
                }
                Section() {
                    TextField("Search by name or email ", text: $searchText)
                                    .padding(.horizontal)
                                    .textFieldStyle(RoundedBorderTextFieldStyle())
                                    .autocapitalization(.none)
                    Picker(selection: $selectedFilter, label: Text("Filter")) {
                        Text("All Users").tag(0)
                        Text("Verified").tag(1)
                        Text("Not Verified").tag(2)
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    if filteredUsers.isEmpty{
                        HStack {
                            Spacer()
                            Image(systemName: "folder")
                                .font(.footnote)
                            Text("Data Empty")
                                .font(.footnote)
                                .fontWeight(.regular)
                            Spacer()
                        }.padding()
                    }else{
                        ForEach(filteredUsers) { user in
                            HStack{
                                Text(user.fullName)
                                Spacer()
                                Text(user.isEmailVerified ? "Verify" : "Not Verify")
                                    .font(.footnote)
                                    .foregroundStyle(user.isEmailVerified ? .blue : .red)
                            }
                        }
                    }
                    
                    
                }
            }
        }
    }
    func filterUsersByKeyword(searchText: String) -> [User] {
        return viewModel.allUsers.filter { user in
            let lowercasedSearchText = searchText.lowercased()
            return user.fullName.lowercased().contains(lowercasedSearchText) ||
                   user.email.lowercased().contains(lowercasedSearchText)
        }
    }
}

#Preview {
    ProvileView().environmentObject(AuthViewModel())
}
