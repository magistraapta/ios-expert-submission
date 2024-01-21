//
//  HomeRouter.swift
//  dicoding-ios-expert-submission
//
//  Created by Magistra Apta on 14/01/24.
//

import Foundation
import SwiftUI
import Game

class HomeRouter {
    
    func makeDetailView(for game: GameModuleDomain) -> some View {
        let detailUseCase = GameInjection.init().provideDetail(game: game)
        let presenter = DetailPresenter(detailUseCase: detailUseCase)
        return DetailView(presenter: presenter)
    }
    
}
