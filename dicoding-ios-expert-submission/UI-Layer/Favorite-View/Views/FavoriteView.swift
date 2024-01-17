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
            Text("Favorite List")
                .font(.title)
                .bold()
            if presenter.favoriteGame.isEmpty {
                VStack {
                    Image("no-data")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                    .frame(width: 300)
                    
                    Text("No data")
                        .foregroundColor(.secondary)
                }
                
            } else {
                List{
                    ForEach(presenter.favoriteGame) { item in
                        presenter.linkBuilder(for: item) {
                            GameRow(game: item)
                        }
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
