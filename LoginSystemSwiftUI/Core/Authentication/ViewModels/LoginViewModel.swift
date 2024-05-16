//
//  LoginViewModel.swift
//  LoginSystemSwiftUI
//
//  Created by Bayu Alif Farisqi on 16/05/24.
//

import Foundation
import SwiftUI
import Combine

@MainActor
class LoginViewModel : ObservableObject {
    @Published var email: String = ""
    @Published var fullName: String = ""
    @Published var password: String = ""
    @Published var confirmPassword: String = ""
    
    @Published var alertMessage: String = ""
    @Published var showAlert: Bool = false
    @Published var isLoading: Bool = false
    @Published var registerSuccess: Bool = false
    
    func signIn(authViewModel: AuthViewModel) {
        isLoading = true
        Task {
            do {
                let loginSuccess = try await authViewModel.signIn(
                    withEmail: email,
                    password: password
                )
                alertMessage = loginSuccess ? "Login Success" : "Login Failed"
                isLoading = false
                showAlert = true
            } catch {
                alertMessage = error.localizedDescription
                isLoading = false
                showAlert = true
            }
        }
    }
    var formIsValidForLogin: Bool {
        !email.isEmpty && email.contains("@") && !password.isEmpty
    }
}
