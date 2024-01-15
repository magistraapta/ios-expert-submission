//
//  FavoriteView.swift
//  dicoding-ios-expert-submission
//
//  Created by Magistra Apta on 15/01/24.
//

import SwiftUI

struct FavoriteView: View {
    
    @ObservedObject var presenter: FavoritePresenter
    var body: some View {
        ZStack {
            if presenter.isLoading {
                loadingIndicatior
            } else if presenter.isError {
                errorIndicator
            } else if presenter.games.isEmpty {
                emptyIndicator
            } else {
                content
            }
        }
        .onAppear {
            presenter.getFavoriteGames()
        }
    }
}

extension FavoriteView{
    var loadingIndicatior: some View {
        VStack {
            ProgressView()
            Text("Loading...")
        }
    }
    
    var errorIndicator: some View {
        Image("error-image")
    }
    
    var emptyIndicator: some View {
        Image("no-data")
    }
    
    var content: some View {
        ScrollView (showsIndicators: false){
            ForEach(presenter.games) { item in
                FavoriteRow(game: item)
            }
        }
    }
    
}

