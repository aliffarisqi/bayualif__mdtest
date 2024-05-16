//
//  ForgotPasswordView.swift
//  LoginSystemSwiftUI
//
//  Created by Bayu Alif Farisqi on 16/05/24.
//

import SwiftUI

struct ForgotPasswordView: View {
    @EnvironmentObject var authViewModel: AuthViewModel
    @Environment(\.dismiss) var dismiss
    @StateObject var forgotPasswordViewModel = ForgotPasswordViewModel()
    

    var body: some View {
        VStack{
            //Image
            ImageAuth(imageName: ImageName.forgot, height: 300)
            
            // form field
            VStack(alignment: .leading, spacing:.size(.s)){
                InputTextView(title: "Email")
                InputFieldView(
                    text: $forgotPasswordViewModel.email,
                    placeholder: TextConstants.PHEmail
                )
                .textInputAutocapitalization(.none)
            }
            .padding(.horizontal)
            .padding(.bottom, .size(.m))
            
            ButtonSubmit(
                title: "RESET PASSWORD",
                isLoading: forgotPasswordViewModel.isLoading,
                isFormValidation: forgotPasswordViewModel.formIsValid,
                action: {
                    forgotPasswordViewModel.forgotPassword(authViewModel: authViewModel)
                }
            )
            .disabled(!forgotPasswordViewModel.formIsValid)
            .alert(isPresented: $forgotPasswordViewModel.showAlert) {
                Alert(title: Text("Reset Password"),
                      message: Text(forgotPasswordViewModel.alertMessage),
                      dismissButton: .default(Text("OK")))
            }
            
            Spacer()
            Button{
                dismiss()
            } label: {
                HStack(spacing: 3){
                    Image(systemName: "arrow.left")
                    Text("Back to Login Page")
                        .fontWeight(.bold)
                }.font(.system(size: 14))
            }
        }
        .navigationTitle("Forgot Password")
    }
}

#Preview {
    ForgotPasswordView()
}
