//
//  ForgotPasswordView.swift
//  LoginSystemSwiftUI
//
//  Created by Bayu Alif Farisqi on 16/05/24.
//

import SwiftUI

struct ForgotPasswordView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    @Environment(\.dismiss) var dismiss
    
    @State private var email: String = ""
    
    @State private var alertMessage: String = ""
    @State private var showAlert: Bool = false
    @State private var isLoading: Bool = false
    
    var body: some View {
        VStack{
            //Image
            Image("flindigital")
                .resizable()
                .scaledToFill()
                .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 120)
                .padding(.vertical, 32)
            
            // form field
            VStack(spacing: 24){
                InputView(
                    text: $email,
                    title: "Email Address",
                    placeholder: "name@example.com"
                )
                .textInputAutocapitalization(.none)
            }
            .padding(.horizontal)
            .padding(.top, 12)
            Button{
                //Send email reset password
                Task{
                    isLoading = true
                    do{
                        let resetPasswordSuccess = try await viewModel.forgotPassword(withEmail: email)
                        if resetPasswordSuccess{
                            alertMessage = "Reset password has been successfully, check email"
                        }else{
                            alertMessage = "Reset password gagal"
                        }
                        isLoading = false
                    }catch{
                        alertMessage = error.localizedDescription
                        isLoading = false
                    }
                    showAlert = true
                }
            }label: {
                HStack{
                    if isLoading {
                        ProgressView()
                            .progressViewStyle(CircularProgressViewStyle())
                            .tint(.white)
                    }else{
                        Text("Reset Password")
                            .fontWeight(.semibold)
                        Image(systemName: "arrow.right")
                    }
                }
                .foregroundStyle(.white)
                .frame(width: UIScreen.main.bounds.width - 32, height: 48)
            }
            .background(Color(.systemBlue))
            .disabled(!formIsValid)
            .opacity(formIsValid ? 1.0 : 0.5)
            .cornerRadius(10)
            .padding(.top, 24)
            .alert(isPresented: $showAlert) {
                Alert(title: Text("Login"),
                message: Text(alertMessage),
                dismissButton: .default(Text("OK")){
                    email = ""
                })
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
    }
}
extension ForgotPasswordView: AuthenticationFormProtocol{
    var formIsValid: Bool{
        return !email.isEmpty
        && email.contains("@")
    }
}

#Preview {
    ForgotPasswordView()
}
