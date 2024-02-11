//
//  Comelon.swift
//  Comelon
//
//  Created by José Angel Prieto on 1/28/24.
//

import Foundation

struct Comelon: Decodable, Identifiable {
    let id: Int
    let name: String
    let description: String
    let price: Double
    let imageURL: String
    let calories: Int
    let protein: Int
    let carbs: Int
}

struct ComelonResponse: Decodable {
    let request: [Comelon]
}

struct MockData {
    static let sampleComelon = Comelon(id: 1,name: "Comida Comelon",description: "Es una comida de Comelon",price: 9.99,imageURL: "",calories: 99,protein: 89,carbs: 99)
    
    static let comelonData = [sampleComelon, sampleComelon,sampleComelon, sampleComelon,sampleComelon, sampleComelon]
}


