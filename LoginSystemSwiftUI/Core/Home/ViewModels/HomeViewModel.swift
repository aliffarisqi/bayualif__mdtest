//
//  HomeViewModel.swift
//  LoginSystemSwiftUI
//
//  Created by Bayu Alif Farisqi on 16/05/24.
//

import Foundation
import SwiftUI

@MainActor
class HomeViewModel: ObservableObject {
    @Published var selectedFilter = 0
    @Published var searchText = ""
    @Published var filteredUsers: [User] = []
    
    private var allUsers: [User] = []
    
    func setUsers(_ users: [User]) {
        self.allUsers = users
        applyFilters()
    }
    
    func applyFilters() {
        let filtered = selectedFilter == 0 ? allUsers : (selectedFilter == 1 ? allUsers.filter {
            $0.isEmailVerified
        } : allUsers.filter {
            !$0.isEmailVerified
        })
        
        if searchText.isEmpty {
            filteredUsers = filtered
        } else {
            filteredUsers = filterUsersByKeyword(searchText: searchText, users: filtered)
        }
    }
    
    private func filterUsersByKeyword(searchText: String, users: [User]) -> [User] {
        return users.filter { user in
            let lowercasedSearchText = searchText.lowercased()
            return user.fullName.lowercased().contains(lowercasedSearchText) ||
                   user.email.lowercased().contains(lowercasedSearchText)
        }
    }
}
