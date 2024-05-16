//
//  ForgotPasswordViewModel.swift
//  LoginSystemSwiftUI
//
//  Created by Bayu Alif Farisqi on 16/05/24.
//

import Foundation
import SwiftUI
import Combine

class ForgotPasswordViewModel: ObservableObject{
    @Published var email: String = ""
    
    @Published  var alertMessage: String = ""
    @Published  var showAlert: Bool = false
    @Published  var isLoading: Bool = false
    
    func forgotPassword(authViewModel: AuthViewModel) {
        isLoading = true
        Task{
            do{
                let resetPasswordSuccess = try await authViewModel.forgotPassword(withEmail: email)
                alertMessage = resetPasswordSuccess  ? TextConstants.succesFPS : TextConstants.failedFPS
                isLoading = false
            }catch{
                alertMessage = error.localizedDescription
                isLoading = false
            }
            showAlert = true
        }
    }
    var formIsValid: Bool{
        return !email.isEmpty && email.contains("@")
    }
    
}
