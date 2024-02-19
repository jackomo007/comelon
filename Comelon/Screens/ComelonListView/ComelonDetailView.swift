//
//  ComelonDetailView.swift
//  Comelon
//
//  Created by José Angel Prieto on 2/11/24.
//

import SwiftUI

struct ComelonDetailView: View {
    
    let comelon: Comelon
    @Binding var isShowingDetail: Bool
    
    var body: some View {
        VStack {
            ComelonRemoteImage(urlString: comelon.imageURL)
                .aspectRatio(contentMode: .fit)
                .frame(width: 300, height: 225)
            
            VStack {
                Text(comelon.name)
                    .font(.title2)
                    .fontWeight(.semibold)
                
                Text(comelon.description)
                    .multilineTextAlignment(.center)
                    .font(.body)
                    .padding()
                
                HStack(spacing: 40) {
                    NutritionInfo(title: "Calories", value: comelon.calories)
                    NutritionInfo(title: "Carbs", value: comelon.carbs)
                    NutritionInfo(title: "Proteins", value: comelon.protein)
                }
            }
            
            Spacer()
            
            Button {
                print("tapped")
            } label: {
               COButton(titleButton: "$\(comelon.price, specifier: "%.2f") - Add To Order")
            }
            .padding(.bottom, 30)
        }
        .frame(width: 300, height: 525)
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .shadow(radius: 40)
        .overlay(Button {
            isShowingDetail = false
        } label: {
           XDismissButton()
        }, alignment: .topTrailing)
    }
}

#Preview {
    ComelonDetailView(comelon: MockData.sampleComelon, isShowingDetail: .constant(true))
}

struct NutritionInfo: View {
    let title: String
    let value: Int
    
    var body: some View {
        VStack(spacing: 5) {
            Text(title)
                .bold()
                .font(.caption)
            
            Text("\(value)")
                .foregroundStyle(.secondary)
                .fontWeight(.semibold)
                .italic()
        }
    }
}
