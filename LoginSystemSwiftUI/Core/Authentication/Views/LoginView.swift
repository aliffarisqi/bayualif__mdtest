//
//  LoginView.swift
//  LoginSystemSwiftUI
//
//  Created by Bayu Alif Farisqi on 15/05/24.
//

import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    @EnvironmentObject var viewModel: AuthViewModel
    
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
                }
                .padding(.horizontal)
                .padding(.top, 12)
                
                // sign in button
                Button{
                    Task{
                        try await viewModel.signIn(withEmail: email, password: password)
                    }
                }label: {
                    HStack{
                        Text("SIGN IN")
                            .fontWeight(.semibold)
                        Image(systemName: "arrow.right")
                    }
                    .foregroundStyle(.white)
                    .frame(width: UIScreen.main.bounds.width - 32, height: 48)
                }
                .background(Color(.systemBlue))
                .disabled(formIsValid)
                .opacity(formIsValid ? 1.0 : 0.5)
                .cornerRadius(10)
                .padding(.top, 24)
                
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
        && !password.isEmpty
        && password.count > 6
    }
}

#Preview {
    LoginView()
}
