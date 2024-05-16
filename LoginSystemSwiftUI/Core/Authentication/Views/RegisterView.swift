//
//  RegisterView.swift
//  LoginSystemSwiftUI
//
//  Created by Bayu Alif Farisqi on 15/05/24.
//

import SwiftUI

struct RegisterView: View {
    
    @EnvironmentObject var viewModel: AuthViewModel
    @Environment(\.dismiss) var dismiss
    
    @State private var email: String = ""
    @State private var fullName: String = ""
    @State private var password: String = ""
    @State private var conformPassword: String = ""
    
    @State private var alertMessage: String = ""
    @State private var showAlert: Bool = false
    @State private var isLoading: Bool = false
    @State private var registerSuccess: Bool = false
    
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
                InputView(
                    text: $fullName,
                    title: "Full Name",
                    placeholder: "Enter Your Name ..."
                )
                
                InputView(
                    text: $password,
                    title: "Password",
                    placeholder: "Input your password",
                    isSecureField: true
                )
                ZStack(alignment: .trailing){
                    InputView(
                        text: $conformPassword,
                        title: "Confirm Password",
                        placeholder: "Confirm your password",
                        isSecureField: true
                    )
                    if !password.isEmpty && !conformPassword.isEmpty{
                        if password == conformPassword{
                            Image(systemName: "checkmark.circle.fill")
                                .imageScale(.large)
                                .fontWeight(.bold)
                                .foregroundStyle(Color(.systemGreen))
                        }else{
                            Image(systemName: "xmark.circle.fill")
                                .imageScale(.large)
                                .fontWeight(.bold)
                                .foregroundStyle(Color(.red))
                        }
                    }
                }
            }
            .padding(.horizontal)
            .padding(.top, 12)
            Button{
                Task{
                    isLoading = true
                    do{
                        let registerIsSuccess = try await viewModel.createUser(withEmail:email,password: password,fullname: fullName)
                        if registerIsSuccess {
                            registerSuccess = true
                            alertMessage = "Your account has been successfully registered, please verify your account via email"
                        }else{
                            alertMessage = "Failed Registered, check your email or connection"
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
                Alert(title: Text("Register"),
                message: Text(alertMessage),
                dismissButton: .default(Text("OK")){
                    if registerSuccess{
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
    }
}
extension RegisterView: AuthenticationFormProtocol{
    var formIsValid: Bool{
        return !email.isEmpty
        && email.contains("@")
        && !password.isEmpty
        && password.count > 5
        
        && conformPassword == password
        && !fullName.isEmpty
    }
}
#Preview {
    RegisterView()
}
