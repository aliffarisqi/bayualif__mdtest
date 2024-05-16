//
//  InputView.swift
//  LoginSystemSwiftUI
//
//  Created by Bayu Alif Farisqi on 15/05/24.
//

import SwiftUI

struct InputFieldView: View {
    @Binding var text: String
    
    let placeholder: String
    var isSecureField =  false
    var isPass = false
    @State private var isPasswordVisible: Bool = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: .size(.s)){
            
            if isSecureField && isPass {
                ZStack(alignment: .trailing){
                    if !isPasswordVisible{
                        SecureField(placeholder, text: $text)
                            .textContentType(.newPassword)
                            .autocorrectionDisabled(true)
                            .inputFieldStyle()
                    }else{
                        TextField(placeholder, text: $text)
                            .inputFieldStyle()
                    }
                    Button(action: {
                        
                        isPasswordVisible.toggle()
                    }) {
                        Image(systemName: !isPasswordVisible ? "eye.slash" : "eye")
                            .foregroundColor(.gray)
                    }.padding(.horizontal)
                        .frame(height: 20)
                }
                
            } else if isSecureField{
                SecureField(placeholder, text: $text)
                    .textContentType(.newPassword)
                    .autocorrectionDisabled(true)
                    .inputFieldStyle()
            }
            else {
                TextField(placeholder, text: $text)
                    .inputFieldStyle()
            }
        }
    }
}

#Preview {
    InputFieldView(text: .constant(""), placeholder: "name@example.com")
}
