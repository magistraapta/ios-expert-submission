//
//  FavoriteRow.swift
//  dicoding-ios-expert-submission
//
//  Created by Magistra Apta on 15/01/24.
//

import SwiftUI

struct FavoriteRow: View {
    var game: GameModel
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: game.backgroundImage)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100)
                    .cornerRadius(12)
            } placeholder: {
                Rectangle()
                    .foregroundColor(.secondary)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100)
                    .cornerRadius(12)
            }
            
            Text(game.name)
                .font(.title2)
                .bold()
            Text(game.released)
                .foregroundColor(.secondary)

        }
    }
}


