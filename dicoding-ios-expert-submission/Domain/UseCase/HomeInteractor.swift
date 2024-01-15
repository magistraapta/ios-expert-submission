//
//  HomeInteractor.swift
//  dicoding-ios-expert-submission
//
//  Created by Magistra Apta on 14/01/24.
//

import Foundation
import Combine

protocol HomeUseCase {
    func getGames() -> AnyPublisher<[GameModel], Error>
}

class HomeInteractor: HomeUseCase {
    private let repository: GameRepositoryProtocol
    
    required init(repository: GameRepositoryProtocol) {
        self.repository = repository
    }
    
    func getGames() -> AnyPublisher<[GameModel], Error> {
        return repository.getGames()
    }
}
