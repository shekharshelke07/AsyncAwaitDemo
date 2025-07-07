//
//  ContentView.swift
//  AsyncAwaitDemo
//
//  Created by Shekhar Shelke on 06/07/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel: MovieViewModel = MovieViewModel()
    
    var body: some View {
        NavigationStack {
            if viewModel.movies.isEmpty {
                ProgressView("Loading movies...")
            } else {
                List(viewModel.movies) { movie in
                    RowView(movie: movie)
                }
                .navigationTitle("Movies")
            }
        }
        .task(priority: .background, {
            await viewModel.fetchMovieList()
        }) 
    }
}

#Preview {
    ContentView()
}
