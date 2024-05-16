//
//  InputTextView.swift
//  LoginSystemSwiftUI
//
//  Created by Bayu Alif Farisqi on 16/05/24.
//

import SwiftUI

struct InputTextView: View {
    let title: String
    
    var body: some View {
        Text(title)
            .foregroundStyle(.textMain)
            .fontWeight(.semibold)
            .font(.subheadline)
    }
}

#Preview {
    InputTextView(title: "Email")
}
