//
//  DetailUseCase.swift
//  dicoding-ios-expert-submission
//
//  Created by Magistra Apta on 15/01/24.
//

import Foundation
import Combine

protocol DetailUseCase {
    func getGame() -> GameModel
//    func updateFavorite() -> AnyPublisher<GameModel, Error>
}

class DetailInteractor: DetailUseCase {
    private let repository: GameRepositoryProtocol
    private let game: GameModel
    
    required init (repository: GameRepositoryProtocol, game: GameModel) {
        self.repository = repository
        self.game = game
    }
    
    func getGame() -> GameModel {
        return game
    }
    
//    func updateFavorite() -> AnyPublisher<GameModel, Error> {
//        return repository.updateFavoriteGame(by: game.id)
//    }
//
    
}
