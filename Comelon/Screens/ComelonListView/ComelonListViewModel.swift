//
//  ComelonListViewModel.swift
//  Comelon
//
//  Created by José Angel Prieto on 2/10/24.
//

import SwiftUI

final class ComelonListViewModel: ObservableObject {
    @Published var comelones: [Comelon] = []
    @Published var alertItem: AlertItem?
    @Published var isLoading = false
    
    func getComelones() {
        isLoading = true
        NetworkManager.shared.getComelones { result in
            DispatchQueue.main.async {
                self.isLoading = false
                switch result {
                case .success(let comelones):
                    self.comelones = comelones
                case .failure(let error):
                    switch error {
                    case .invalidResponse:
                        self.alertItem = AlertContext.invalidResponse;
                    case .invalidURL:
                        self.alertItem = AlertContext.invalidURL;
                    case .invalidData:
                        self.alertItem = AlertContext.invalidData;
                    case .unableToComplete:
                        self.alertItem = AlertContext.unableToComplete;
                    }
                }
            }
        }
    }
}
