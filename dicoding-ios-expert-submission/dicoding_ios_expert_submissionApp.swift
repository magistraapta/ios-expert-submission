//
//  dicoding_ios_expert_submissionApp.swift
//  dicoding-ios-expert-submission
//
//  Created by Magistra Apta on 13/01/24.
//

import SwiftUI
import Game

@main
struct dicoding_ios_expert_submissionApp: App {
    let homePresenter = HomePresenter(homeUseCase: GameInjection.init().provideHome())
    let favoritePresenter = FavoritePresenter(favoriteUseCase: GameInjection.init().provideFavorite())
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(homePresenter)
                .environmentObject(favoritePresenter)
        }
    }
}
