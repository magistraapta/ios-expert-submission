//
//  GameRow.swift
//  dicoding-ios-expert-submission
//
//  Created by Magistra Apta on 14/01/24.
//

import SwiftUI

struct GameRow: View {
    var game: GameModel
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: game.backgroundImage)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200)
                    .cornerRadius(12)
            } placeholder: {
                Rectangle()
                    .foregroundColor(.secondary)
                    .frame(width: 200, height: 100)
                    .cornerRadius(12)
            }
            
            VStack (alignment: .leading, spacing:  12){
                Text(game.name)
                    .font(.title2)
                    .bold()
                Text(game.released)
                    .foregroundColor(.secondary)
            }

        }
    }
}

struct GameRow_Previews: PreviewProvider {
    static var previews: some View {
        let game = GameModel(id: 1, slug: "gta-v", name: "gta v", released: "2014", backgroundImage: "https://media.rawg.io/media/games/20a/20aa03a10cda45239fe22d035c0ebe64.jpg", rating: 4.9)
        GameRow(game: game)
    }
}
