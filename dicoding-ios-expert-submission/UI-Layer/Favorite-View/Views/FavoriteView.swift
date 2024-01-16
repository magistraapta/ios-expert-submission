//
//  FavoriteView.swift
//  dicoding-ios-expert-submission
//
//  Created by Magistra Apta on 16/01/24.
//

import SwiftUI

struct FavoriteView: View {
    @ObservedObject var presenter: FavoritePresenter = .init(favoriteUseCase: Injection.init().provideFavorite())
    var body: some View {
        VStack{
            if presenter.favoriteGame.isEmpty {
                Text("favorite is empty")
            } else {
                List{
                    ForEach(presenter.favoriteGame) { item in
                        GameRow(game: item)
                    }
                }
                .listStyle(.plain)
            }
        }
        .onAppear {
            presenter.getFavorite()
        }
    }
}

struct FavoriteView_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteView()
    }
}
