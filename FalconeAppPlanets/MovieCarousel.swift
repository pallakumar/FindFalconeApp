//
//  MovieCarousel.swift
//  FalconeAppPlanets
//
//  Created by apple on 24/07/25.
//

import SwiftUI

struct Movie: Identifiable {
    let id = UUID()
    let title: String
    let imageName: String
}

struct MovieCarousel: View {
    let movies: [Movie] = [
        Movie(title: "Inception", imageName: "inception"),
        Movie(title: "Avatar", imageName: "avatar"),
        Movie(title: "Interstellar", imageName: "interstellar"),
        Movie(title: "Dark Knight", imageName: "darkknight"),
        Movie(title: "Hari Hara Veera Mallu", imageName: "HariHaraVeeraMallu"),
        Movie(title: "OG", imageName: "OG")

    ]
    
    var body: some View {
        GeometryReader { outerProxy in
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 20) {
                    ForEach(movies) { movie in
                        GeometryReader { innerProxy in
                            let scale = getScale(proxy: innerProxy, outerProxy: outerProxy)
                            let rotation = Double((1 - scale) * 25)

                            
                            NavigationLink(destination: MovieDetailView(movie: movie)) {
                                VStack {
                                    Image(movie.imageName)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 200, height: 300)
                                        .clipped()
                                        .cornerRadius(20)
                                        .shadow(radius: 5)
                                    
                                    Text(movie.title)
                                        .font(.headline)
                                        .padding(.top, 10)
                                }
                                .scaleEffect(scale)
                                .rotation3DEffect(
                                    .degrees(rotation),
                                    axis: (x: 0, y: 1, z: 0)
                                )
                                .buttonStyle(.plain) // To remove default blue effect
                            }
                            .frame(width: 200, height: 380)
                        }
                        .frame(width: 200, height: 380)
                    }
                }
                .padding(40)
            }
        }
        .frame(height: 400)
    }
    
    private func getScale(proxy: GeometryProxy, outerProxy: GeometryProxy) -> CGFloat {
        let midX = proxy.frame(in: .global).midX
        let center = outerProxy.size.width / 2
        let distance = abs(center - midX)
        let maxDistance: CGFloat = 200
        let scale = max(1 - (distance / maxDistance) * 0.3, 0.7)
        return scale
    }
}



struct MovieCarousel_Previews: PreviewProvider {
    static var previews: some View {
        MovieCarousel()
    }
}
