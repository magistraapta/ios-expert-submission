//
//  FavoriteInteractor.swift
//  dicoding-ios-expert-submission
//
//  Created by Magistra Apta on 15/01/24.
//

import Foundation
import Combine

protocol FavoriteUseCase {
    func getFavoriteGames() -> AnyPublisher<[GameModel], Error>
}

class FavoriteInteractor: FavoriteUseCase {
    private let repository: GameRepositoryProtocol
    
    required init(repository: GameRepositoryProtocol) {
        self.repository = repository
    }
    
    func getFavoriteGames() -> AnyPublisher<[GameModel], Error> {
        return repository.getFavorite()
    }
}
