//
//  Movie.swift
//  AsyncAwaitDemo
//
//  Created by Shekhar Shelke on 06/07/25.
//

import Foundation

struct Movie: Decodable, Identifiable {
    var id: UUID = UUID()
    var title: String
    var year: String
    var runtime: String
    var poster: String?
    
    enum CodingKeys: String, CodingKey {
        case title = "Title"
        case year = "Year"
        case runtime = "Runtime"
        case poster = "Poster"
    }
}
