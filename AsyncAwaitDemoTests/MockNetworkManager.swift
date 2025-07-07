//
//  MockNetworkManager.swift
//  AsyncAwaitDemo
//
//  Created by Shekhar Shelke on 07/07/25.
//

import XCTest
@testable import AsyncAwaitDemo

class MockNetworkManager: NetworkManagerRequestProtocol{
    func request<S>(url: String) async throws -> [S] where S : Decodable {
        let movieData: [Movie]  = [
            Movie(title: "Movie 1", year: "2000", runtime: "120 min", poster: nil),
            Movie(title: "Movie 2", year: "2001", runtime: "270 min", poster: nil),
            Movie(title: "Movie 3", year: "2010", runtime: "300 min", poster: nil)
        ]
        return movieData as! [S]
    }
}
