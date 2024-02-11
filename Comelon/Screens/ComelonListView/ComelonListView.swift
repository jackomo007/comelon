//
//  ComelonListView.swift
//  Comelon
//
//  Created by José Angel Prieto on 1/28/24.
//

import SwiftUI

struct ComelonListView: View {
    
    @StateObject var viewModel = ComelonListViewModel()
    
    var body: some View {
        ZStack {
            NavigationView {
                List(viewModel.comelones) {
                    comelon in
                    ComelonListCell(comelon: comelon)
                }
                .navigationTitle("🤩🍔 Comelon")
            }
            .onAppear{
                viewModel.getComelones()
            }
            
            if viewModel.isLoading {
                LoadingView()
            }
        }
        .alert(item: $viewModel.alertItem) { alertItem in
            Alert(title: alertItem.title,
                  message: alertItem.message,
                  dismissButton: alertItem.dissmissButton)
        }
    }
}

#Preview {
    ComelonListView()
}

