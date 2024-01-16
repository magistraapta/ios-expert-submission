//
//  GameRepository.swift
//  dicoding-ios-expert-submission
//
//  Created by Magistra Apta on 14/01/24.
//

import Foundation
import Combine

protocol GameRepositoryProtocol {
    func getGames() -> AnyPublisher<[GameModel], Error>
    func getFavorite() -> AnyPublisher<[GameModel], Error>
    func updateFavoriteGame(by id: Int) -> AnyPublisher<GameModel, Error>
}
class GameRepository: NSObject {
    
    typealias GameInstance = (LocaleDataSource ,RemoteDataSource) -> GameRepository
    
    fileprivate let remote: RemoteDataSource
    fileprivate let locale: LocaleDataSource
    
    private init(remote: RemoteDataSource, locale: LocaleDataSource) {
        self.remote = remote
        self.locale = locale
    }
    
    static let sharedInstance: GameInstance = { localeRepo, remoteRepo in
        return GameRepository(remote: remoteRepo, locale: localeRepo)
    }
    
}

extension GameRepository: GameRepositoryProtocol {
    
    func getGames() -> AnyPublisher<[GameModel], Error> {
      return self.locale.getGames()
        .flatMap { result -> AnyPublisher<[GameModel], Error> in
          if result.isEmpty {
            return self.remote.getGames()
            .map { GameMapper.mapGameResponsesToEntities(input: $0) }
              .flatMap { self.locale.addGames(from: $0) }
              .filter { $0 }
              .flatMap { _ in self.locale.getGames()
                .map { GameMapper.mapGameEntitiesToDomains(input: $0) }
              }
              .eraseToAnyPublisher()
          } else {
            return self.locale.getGames()
              .map { GameMapper.mapGameEntitiesToDomains(input: $0) }
              .eraseToAnyPublisher()
          }
        }.eraseToAnyPublisher()
    }
    
    func getFavorite() -> AnyPublisher<[GameModel], Error> {
        return self.locale.getFavoriteGames()
            .map { GameMapper.mapGameEntitiesToDomains(input: $0)}
            .eraseToAnyPublisher()
    }

    func updateFavoriteGame(by id: Int) -> AnyPublisher<GameModel, Error> {
        return self.locale.updateFavorite(id: id)
            .map { GameMapper.mapEntityToDomain(input: $0) }
            .eraseToAnyPublisher()
    }
    
}
