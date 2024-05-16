//
//  SignUpViewModel.swift
//  LoginSystemSwiftUI
//
//  Created by Bayu Alif Farisqi on 16/05/24.
//

import Foundation
import SwiftUI
import Combine

class SignUpViewModel: ObservableObject{
    @Published var email: String = ""
    @Published var fullName: String = ""
    @Published var password: String = ""
    @Published var confirmPassword: String = ""
    
    @Published var alertMessage: String = ""
    @Published var showAlert: Bool = false
    @Published var isLoading: Bool = false
    @Published var registerSuccess: Bool = false
    
    func register(authViewModel: AuthViewModel) {
        isLoading = true
        Task {
            do {
                let registerIsSuccess = try await authViewModel.createUser(
                    withEmail: email,
                    password: password,
                    fullname: fullName
                )
                alertMessage = registerIsSuccess ? TextConstants.SuccesSignUp : TextConstants.FailedSignUp
                registerSuccess = registerIsSuccess
                isLoading = false
                showAlert = true
            } catch {
                alertMessage = error.localizedDescription
                isLoading = false
                showAlert = true
            }
        }
    }
    var formIsValidForRegister: Bool {
        !email.isEmpty &&
        email.contains("@") &&
        !password.isEmpty &&
        password.count > 5 &&
        confirmPassword == password &&
        !fullName.isEmpty
    }
    var passwordValidation: Bool{
        return !password.isEmpty &&
        password.count > 5
    }
}
