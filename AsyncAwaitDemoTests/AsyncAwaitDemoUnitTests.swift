//
//  AsyncAwaitDemoUnitTests.swift
//  AsyncAwaitDemo
//
//  Created by Shekhar Shelke on 07/07/25.
//

import XCTest
@testable import AsyncAwaitDemo

final class AsyncAwaitDemoUnitTests: XCTestCase {
    
    func testFetchMoviesUsesMockData() async throws {
        let mockNetworkManager = MockNetworkManager()
        let viewModel = MovieViewModel(networkManager: mockNetworkManager)
        
        await viewModel.fetchMovieList()
        
        XCTAssertEqual(viewModel.movies.count, 3, "Expected 3 mock movies")
        XCTAssertEqual(viewModel.movies.first?.title, "Movie 1")
    }
    
}
