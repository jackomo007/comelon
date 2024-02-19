//
//  COButton.swift
//  Comelon
//
//  Created by José Angel Prieto on 2/17/24.
//

import SwiftUI

struct COButton: View {
    let titleButton: LocalizedStringKey
    var body: some View {
        Text(titleButton)
            .font(.title3)
            .fontWeight(.semibold)
            .frame(width: 260, height: 50)
            .foregroundColor(.white)
            .background(Color.brandPrimary)
            .cornerRadius(10)
    }
}

#Preview {
    COButton(titleButton: "Test title")
}
