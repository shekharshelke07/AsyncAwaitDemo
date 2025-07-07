//
//  NetworkManager.swift
//  AsyncAwaitDemo
//
//  Created by Shekhar Shelke on 06/07/25.
//

import Foundation

enum NetworkError: Error {
    case invalidURL(String)
    case invalidResponse(String)
}

protocol NetworkManagerRequestProtocol {
    func request<S: Decodable>(url: String) async throws -> [S]
}

class NetworkManager: NetworkManagerRequestProtocol {
    
    /// generic func to fetch data from URL
    func request<S: Decodable>(url: String) async throws -> [S] {
        guard let url = URL(string: url) else {
            throw NetworkError.invalidURL("Check URL")
        }
        
        let (data, response)  = try await URLSession.shared.data(from: url)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            throw NetworkError.invalidResponse("Check response")
        }
        
        return try JSONDecoder().decode([S].self, from: data)
    }
}
 
