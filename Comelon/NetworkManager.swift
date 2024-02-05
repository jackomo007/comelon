//
//  NetworkManager.swift
//  Comelon
//
//  Created by José Angel Prieto on 2/4/24.
//

import Foundation

final class NetworkManager {
    static let shared = NetworkManager()
    
    static let baseURL = "https://seanallen-course-backend.herokuapp.com/swiftui-fundamentals/"
    private let comelonURL = baseURL + "appetizers"
    
    private init() {}
    
    func getComelones(completed: @escaping (Result<[Comelon], COError>) -> Void) {
            guard let url = URL(string: comelonURL) else {
                completed(.failure(.invalidURL))
                return
            }
    
            let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
                if let _ = error {
                    completed(.failure(.unableToComplete))
                    return
                }
    
                guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                    completed(.failure(.invalidResponse))
                    return
                }
    
                guard let data = data else {
                    completed(.failure(.invalidData))
                    return
                }
    
                do {
                    let decoder = JSONDecoder()
                    let decodedResponse = try decoder.decode(ComelonResponse.self, from: data)
                    completed(.success(decodedResponse.request))
                } catch {
                    completed(.failure(.invalidData))
                }
            }
    
            task.resume()
        }
}
