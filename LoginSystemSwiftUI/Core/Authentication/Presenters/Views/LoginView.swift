//
//  LoginView.swift
//  LoginSystemSwiftUI
//
//  Created by Bayu Alif Farisqi on 15/05/24.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject var authViewModel: AuthViewModel
    @StateObject private var loginViewModel = LoginViewModel()
    
    var body: some View {
        NavigationStack{
            VStack{
                //Image
                ImageAuth(imageName: ImageName.logIn, height: 250)
                
                // form field
                VStack(alignment: .leading, spacing:.size(.s) ){
                    InputTextView(title: "Email")
                    InputFieldView(
                        text: $loginViewModel.email,
                        placeholder: TextConstants.PHEmail
                    )
                    .textInputAutocapitalization(.never)
                    
                    InputTextView(title: "Password")
                    InputFieldView(
                        text: $loginViewModel.password,
                        placeholder: TextConstants.PHPassword,
                        isSecureField: true,
                        isPass: true
                    )
                    HStack{
                        Spacer()
                        NavigationLink{
                            ForgotPasswordView()
                                .navigationBarBackButtonHidden(true)
                        }label: {
                            HStack(){
                                Text(TextConstants.ForgotPasswordLink)
                                    .font(.footnote)
                                    .fontWeight(.semibold)
                                    .foregroundStyle(Color.blue)
                            }.font(.system(size: 14))
                        }
                    }.padding(.bottom)
                    
                }
                .padding(.horizontal)
                .padding(.top, .size(.s))
                // sign in button
                
                ButtonSubmit(
                    title: "SIGN IN",
                    isLoading: loginViewModel.isLoading,
                    isFormValidation: loginViewModel.formIsValidForLogin,
                    action: {
                        loginViewModel.signIn(authViewModel: authViewModel)
                    }
                )
                .disabled(!loginViewModel.formIsValidForLogin)
                .alert(isPresented: $loginViewModel.showAlert) {
                    Alert(title: Text("Login"),
                          message: Text(loginViewModel.alertMessage),
                          dismissButton: .default(Text("OK")))
                }
                
                Spacer()
                NavigationLink{
                    RegisterView()
                        .navigationBarBackButtonHidden(true)
                }label: {
                    HStack(spacing: 3){
                        Text("Don't have an Account ?")
                        Text("Sign Up")
                            .fontWeight(.bold)
                    }.font(.system(size: 14))
                }
                
            }
            .navigationTitle("Sign In")
        }
    }
}

#Preview {
    LoginView()
}
