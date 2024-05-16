//
//  EmptyDataView.swift
//  LoginSystemSwiftUI
//
//  Created by Bayu Alif Farisqi on 17/05/24.
//

import SwiftUI

struct EmptyDataView: View {
    var body: some View {
        HStack {
            Spacer()
            Image(systemName: "folder")
                .font(.footnote)
            Text("Data Empty")
                .font(.footnote)
                .fontWeight(.regular)
            Spacer()
        }
        .padding()
    }
}

#Preview {
    EmptyDataView()
}
