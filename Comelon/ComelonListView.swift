//
//  ComelonListView.swift
//  Comelon
//
//  Created by José Angel Prieto on 1/28/24.
//

import SwiftUI

struct ComelonListView: View {
    
    @State private var comelones: [Comelon] = []
    
    var body: some View {
        NavigationView {
            List(comelones) {
                comelon in
                ComelonListCell(comelon: comelon)
            }
            .navigationTitle("🤩🍔 Comelon")
        }
        .onAppear{
            getComelones()
        }
    }
    
    func getComelones() {
        NetworkManager.shared.getComelones { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let comelones):
                    self.comelones = comelones
                    
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }
}

#Preview {
    ComelonListView()
}

