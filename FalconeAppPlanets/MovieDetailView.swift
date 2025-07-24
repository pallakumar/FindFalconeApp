
//
//  MovieDetailView.swift
//  FalconeAppPlanets
//
//  Created by apple on 24/07/25.
//

import SwiftUI

struct MovieDetailView: View {
    let movie: Movie

    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                Image(movie.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 300)
                    .cornerRadius(16)

                Text(movie.title)
                    .font(.largeTitle)
                    .bold()
                    .multilineTextAlignment(.center)

                Text(getMovieDescription(for: movie.title))
                    .multilineTextAlignment(.leading)
                    .padding()

                Spacer()
            }
            .padding()
        }
        .navigationTitle(movie.title)
        .navigationBarTitleDisplayMode(.inline)
    }

    func getMovieDescription(for title: String) -> String {
        switch title {
        case "Inception":
            return """
            🎬 Genre: Action, Science Fiction, Thriller
            🎥 Director: Christopher Nolan
            ⭐ Starring: Leonardo DiCaprio, Joseph Gordon-Levitt, Elliot Page, Ken Watanabe, Tom Hardy, Cillian Murphy
            🧠 Concept: Inception involves entering someone's dreams to extract or plant ideas.
            📖 Plot: Cobb assembles a team to perform inception on a business heir, navigating dream layers.
            🧩 Themes: Dreams, reality, memory, and the creative/destructive power of the mind.
            🌌 Visuals: Gravity-defying action, dream landscapes.
            ❓ Ending: Ambiguous—was Cobb dreaming or awake?
            """

        case "OG":
            return """
            🎬 OG — Production started in April 2023 in Mumbai.
            📍 Scenes shot in Pune and Hyderabad.
            🔁 Multiple schedules completed through July 2023.
            👥 Cast: Pawan Kalyan, Priyanka Mohan, Emraan Hashmi.
            🎞️ High expectations for this upcoming action drama.
            """

        case "Avatar":
            return """
            🎬 Avatar
            🌍 Setting: Pandora — a lush, alien moon rich in unobtanium.
            🧬 Concept: Humans control Na'vi-like avatars to interact with the native race.
            📖 Plot: Paraplegic marine Jake Sully becomes an avatar and sides with the Na'vi to protect Pandora.
            🌱 Themes: Colonialism, environmentalism, cultural clash.
            🎥 Visuals: Stunning CGI and immersive 3D world-building.
            """

        case "Interstellar":
            return """
            🎬 Interstellar (2014) — Directed by Christopher Nolan
            ⭐ Cast: Matthew McConaughey, Anne Hathaway, Jessica Chastain, Michael Caine
            🌍 Plot: A team of astronauts travels through a wormhole to find a new home for humanity.
            🧠 Themes: Love, time, gravity, sacrifice, and the survival of the species.
            🎶 Music: Score by Hans Zimmer
            📽️ Runtime: 169 minutes | Budget: $165M | Box Office: $758.6M
            """

        case "Dark Knight":
            return """
            🦇 The Dark Knight (2008) — Directed by Christopher Nolan
            ⭐ Cast: Christian Bale, Heath Ledger, Aaron Eckhart, Michael Caine, Maggie Gyllenhaal
            🔥 Plot: Batman teams with Gordon and Dent to fight crime in Gotham, until Joker unleashes chaos.
            🃏 Joker: A ruthless anarchist testing Batman's moral limits.
            🎵 Music: Hans Zimmer & James Newton Howard
            💰 Box Office: $1.009B | Runtime: 152 min
            """

        case "Hari Hara Veera Mallu":
            return """
            ⚔️ Hari Hara Veera Mallu (2025) — Telugu Period Action Drama
            🎬 Directed by Krish Jagarlamudi
            ⭐ Cast: Pawan Kalyan, Bobby Deol, Nidhhi Agerwal, Nora Fatehi
            🕌 Set in the 17th-century Mughal Empire.
            💎 Plot: Veera Mallu must recover the Koh-i-Noor diamond to protect a city.
            🎞️ Epic adventure with high-octane visuals and history-meets-heroism story.
            """

        default:
            return "No description available for this movie."
        }
    }
}
