//
//  CardView.swift
//  ios-movies-card
//
//  Created by Santiago Mattiauda on 16/12/21.
//

import SwiftUI

struct CardView: View, Identifiable {
    
    let id = UUID()
    
    let movie : Movie
    
    var body: some View {
        VStack(alignment:.center) {
            AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w500\(movie.image)")) { image in
                image
                    .resizable()
                    .scaledToFit()
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .cornerRadius(20)
                    .padding(.horizontal, 20)
            } placeholder: {
                ProgressView()
                    .frame(minWidth: 0, maxWidth: .infinity)
            }
        }
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(movie: movies[0])
    }
}
