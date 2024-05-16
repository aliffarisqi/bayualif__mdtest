//
//  ProvileView.swift
//  LoginSystemSwiftUI
//
//  Created by Bayu Alif Farisqi on 15/05/24.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var authViewModel: AuthViewModel
    @StateObject private var homeViewModel = HomeViewModel()
    
    var body: some View {
        if let user = authViewModel.currentUser {
            List {
                Section {
                    CardAccount(initialName: user.initials, fullName: user.fullName, emailAddress: user.email, isEmailVerified: user.isEmailVerified)
                        .padding(.top, 6)
                    Button {
                        authViewModel.signOut()
                    } label: {
                        SettingRowView(
                            imageName: SFSymbol.logOut,
                            title: "Sign Out",
                            tintColor: Color(.red)
                        )
                    }
                    .padding(.bottom, 6)
                }
                
                
                Section(
                    header: Text("All User")
                        .font(.headline)
                        .foregroundStyle(.textMain)
                        .fontWeight(.bold)
                ) {
                    VStack{
                        TextField("Search by name or email ", text: $homeViewModel.searchText)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .autocapitalization(.none)
                            .onChange(of: homeViewModel.searchText) { _ in
                                homeViewModel.applyFilters()
                            }
                    }.padding(.vertical,6)
                    
                    Picker(selection: $homeViewModel.selectedFilter, label: Text("Filter")) {
                        Text("All Users").tag(0)
                        Text("Verified").tag(1)
                        Text("Not Verified").tag(2)
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .onChange(of: homeViewModel.selectedFilter) { _ in
                        homeViewModel.applyFilters()
                    }
                    
                    if homeViewModel.filteredUsers.isEmpty {
                        EmptyDataView()
                    } else {
                        ForEach(homeViewModel.filteredUsers) { user in
                            CardAccountList(
                                initialName: user.initials,
                                fullName: user.fullName,
                                emailAddress: user.email,
                                isEmailVerified: user.isEmailVerified
                            )
                        }
                    }
                }
            }
            .onAppear {
                homeViewModel.setUsers(authViewModel.allUsers)
                
            }
        }
    }
}

#Preview {
    HomeView().environmentObject(AuthViewModel())
}
