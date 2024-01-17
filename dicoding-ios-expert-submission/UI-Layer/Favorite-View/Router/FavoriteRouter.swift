//
//  FavoriteRouter.swift
//  dicoding-ios-expert-submission
//
//  Created by Magistra Apta on 17/01/24.
//

import Foundation
import SwiftUI

class FavoriteRouter {
    
    func makeDetailView(for game: GameModel) -> some View {
        let detailUseCase = Injection.init().provideDetail(game: game)
        let presenter = DetailPresenter(detailUseCase: detailUseCase)
        return DetailView(presenter: presenter)
    }
    
}
