//
//  MovieView.swift
//  MoviesTrailer
//
//  Created by An Nguyen 2 on 8/29/21.
//

import SwiftUI
import shared

struct MovieView: View {
    var movie: Movie
    
    var body: some View {
        HStack {
            if #available(iOS 15.0, *) {
                AsyncImage(url: .init(string: movie.posterPathUrl3), scale: 1, transaction: .init(animation: .easeIn)) { imagePhase in
                    if let image = imagePhase.image {
                        image.resizable()
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                    } else if imagePhase.error != nil {
                        ErrorView(error: imagePhase.error)
                    } else {
                        ProgressView()
                    }
                }
                .frame(width: 75, height: 110)
                .scaledToFit()
            } else {
                // Fallback on earlier versions
            }
            
            VStack(alignment: .leading, spacing: 8) {
                HStack {
                    Text(movie.originalTitle)
                        .lineLimit(1)
                        .font(.title3.bold())
                    
                    Spacer()
                    
                    Text("\(movie.voteCount) \(Image(systemName: "star"))")
                        .font(.caption)
                        .padding(EdgeInsets(top: 3, leading: 7, bottom: 3, trailing: 7))
                        .background(Color.gray.opacity(0.6).cornerRadius(9))
                        .foregroundColor(.white)
                }
                
                Text(movie.overview)
                    .font(.body)
                    .lineLimit(2)
                
                Text("\(movie.releaseDate())")
                    .lineLimit(1)
                    .font(.caption.italic())
                    .foregroundColor(Color.gray)
                    .padding(.trailing)
            }
        }
    }
}

struct MovieView_Previews: PreviewProvider {
    static var previews: some View {
        MovieView(movie: Movie())
    }
}
