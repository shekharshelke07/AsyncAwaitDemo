//
//  MovieViewModel.swift
//  AsyncAwaitDemo
//
//  Created by Shekhar Shelke on 06/07/25.
//

import Foundation

class MovieViewModel: ObservableObject {
    @Published var movies: [Movie] = []
    
    /// enabling DIP (Dependency Inversion Principle)
    private let networkManager: NetworkManagerRequestProtocol

    init(networkManager: NetworkManagerRequestProtocol = NetworkManager()) {
        self.networkManager = networkManager
    }
    
    func fetchMovieList() async {
        do {
            let result: [Movie] = try await networkManager.request(url: "\(Constant.BASE_URL)")
            
            /// assigning to main thread as 'movies' is published property
            await MainActor.run {
                self.movies = result
            }
            print("Movies: \(movies)")
        } catch let error as NetworkError {
            switch error {
                case .invalidURL(let message):
                    print("Invalid URL error: \(message)")
                case .invalidResponse(let details):
                    print("Invalid response error: \(details)")
                }
        } catch {
            print("Other unexpected error: \(error)")
        }
    }
}
