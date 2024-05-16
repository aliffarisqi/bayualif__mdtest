//
//  RegisterView.swift
//  LoginSystemSwiftUI
//
//  Created by Bayu Alif Farisqi on 15/05/24.
//

import SwiftUI

struct RegisterView: View {
    
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var authViewModel: AuthViewModel
    @StateObject private var signUpViewModel = SignUpViewModel()
    
    
    var body: some View {
        VStack{
            //Image
            ImageAuth(imageName: ImageName.signUp, height: 80)
                .padding()
            
            // form field
            VStack(alignment: .leading, spacing:.size(.s)){
                InputTextView(title: "Email")
                InputFieldView(
                    text: $signUpViewModel.email,
                    placeholder: TextConstants.PHEmail
                )
                .textInputAutocapitalization(.none)
                
                InputTextView(title: "Fullname")
                InputFieldView(
                    text: $signUpViewModel.fullName,
                    placeholder: TextConstants.PHFullname
                )
                
                HStack{
                    InputTextView(title: "Password")
                    Spacer()
                    Text("Password minimum 6 character")
                        .font(.system(size: .size(.m)))
                        .foregroundStyle(signUpViewModel.passwordValidation ? .green : .gray)
                }
                InputFieldView(
                    text: $signUpViewModel.password,
                    placeholder: TextConstants.PHPassword,
                    isSecureField: true,
                    isPass: true
                )
                    InputTextView(title: "Confirm Password")
                    
                
                ZStack(alignment: .trailing){
                    InputFieldView(
                        text: $signUpViewModel.confirmPassword,
                        placeholder: TextConstants.PHPsConfirm,
                        isSecureField: true
                    )
                    if !signUpViewModel.password.isEmpty && !signUpViewModel.confirmPassword.isEmpty {
                        if signUpViewModel.password == signUpViewModel.confirmPassword {
                            IconImage(imageName: SFSymbol.check, iconColor: .green)
                                .padding()
                        } else {
                            IconImage(imageName: SFSymbol.xmark, iconColor: .red)
                                .padding()
                        }
                    }
                }
            }
            .padding(.horizontal)
            .padding(.bottom, .size(.m))
            // Sign up button
            ButtonSubmit(
                title: "SIGN UP",
                isLoading: signUpViewModel.isLoading,
                isFormValidation: signUpViewModel.formIsValidForRegister,
                action: {
                    signUpViewModel.register(authViewModel: authViewModel)
                }
            )
            .disabled(!signUpViewModel.formIsValidForRegister)
            .alert(isPresented: $signUpViewModel.showAlert) {
                Alert(title: Text("Register"),
                      message: Text(signUpViewModel.alertMessage),
                      dismissButton: .default(Text("OK")) {
                    if signUpViewModel.registerSuccess {
                        dismiss()
                    }
                })
            }
            
            Spacer()
            Button{
                dismiss()
            } label: {
                HStack(spacing: 3){
                    Text("Already have an Account ?")
                    Text("Sign In")
                        .fontWeight(.bold)
                }.font(.system(size: 14))
            }
        }
        .navigationTitle("Sign Up")
    }
}
#Preview {
    RegisterView()
}
