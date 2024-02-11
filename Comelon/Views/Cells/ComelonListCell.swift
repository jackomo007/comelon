//
//  ComelonListCell.swift
//  Comelon
//
//  Created by José Angel Prieto on 2/4/24.
//

import SwiftUI

struct ComelonListCell: View {
    let comelon: Comelon
    
    var body: some View {
        HStack {
            ComelonRemoteImage(urlString: comelon.imageURL)
                .aspectRatio(contentMode: .fit)
                .frame(width: 120, height: 90)
                .cornerRadius(8)
            
            VStack(alignment: .leading, spacing: 5) {
                Text(comelon.name)
                    .font(.title2)
                    .fontWeight(.medium)
                
                Text("$\(comelon.price, specifier: "%.2f")")
                    .foregroundStyle(.secondary)
                    .fontWeight(.semibold)
            }
            .padding(.leading)
        }
    }
}

#Preview {
    ComelonListCell(comelon: MockData.sampleComelon)
}
