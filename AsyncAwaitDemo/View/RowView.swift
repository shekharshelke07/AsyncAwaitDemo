//
//  RowView.swift
//  AsyncAwaitDemo
//
//  Created by Komal's MAC on 07/07/25.
//

import SwiftUI

struct RowView: View {
    var movie: Movie
    var body: some View {
        HStack {
            if let moviePoster = movie.poster,
               let posterURL = URL(string: moviePoster) {
                moviePosterImage(url: posterURL)
            } else {
                Text("No Image")
                    .font(.callout)
                    .foregroundStyle(Color.blue)
                    .scaledToFit()
                    .frame(width: 120, height: 90)
                    .padding(.trailing, 5)
            }
            
            VStack(alignment: .leading) {
                Text("\(movie.title)")
                    .font(.headline)
                Text("\(movie.year)")
                    .font(.subheadline)
                Text("\(movie.runtime)")
                    .font(.caption2)
            }
        }
    }
    
    func moviePosterImage(url: URL) -> some View
    {
        AsyncImage(url: url) { image in
            image.resizable()
                .scaledToFit()
                .frame(width: 120, height: 90)
                .padding(.trailing, 5)
        } placeholder: {
            ProgressView()
        }
    }
}

#Preview {
    RowView(movie: Movie(title: "Title", year: "2025", runtime: "75 min"))
}
