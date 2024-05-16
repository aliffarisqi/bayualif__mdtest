//
//  LoginView.swift
//  LoginSystemSwiftUI
//
//  Created by Bayu Alif Farisqi on 15/05/24.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    
    @State private var email: String = ""
    @State private var password: String = ""
    
    @State private var alertMessage: String = ""
    @State private var showAlert: Bool = false
    @State private var isLoading: Bool = false
    
    
    var body: some View {
        NavigationStack{
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
                    
                    InputView(
                        text: $password,
                        title: "Password",
                        placeholder: "Input your password",
                        isSecureField: true
                    )
                    HStack{
                        Spacer()
                        NavigationLink{
                            ForgotPasswordView()
                                .navigationBarBackButtonHidden(true)
                        }label: {
                            HStack(){
                                Text("Forgot Password ?")
                                    .font(.footnote)
                                    .fontWeight(.regular)
                                    .foregroundStyle(Color.blue)
                            }.font(.system(size: 14))
                        }
                        
                    }
                }
                .padding(.horizontal)
                .padding(.top, 12)
                
                // sign in button
                Button{
                    Task{
                        isLoading = true
                        do{
                            let loginSuccess = try await viewModel.signIn(withEmail: email, password: password)
                            if loginSuccess{
                                alertMessage = "Login Success"
                            }else{
                                alertMessage = "Login Failed"
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
                            Text("SIGN IN")
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
                    dismissButton: .default(Text("OK")))
                }
                
                Spacer()
                //sign up button
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
        }
    }
}
extension LoginView: AuthenticationFormProtocol{
    var formIsValid: Bool{
        return !email.isEmpty
        && email.contains("@")
        && !password.isEmpty    }
}

#Preview {
    LoginView()
}
