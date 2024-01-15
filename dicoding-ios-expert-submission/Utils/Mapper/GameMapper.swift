//
//  GameMapper.swift
//  dicoding-ios-expert-submission
//
//  Created by Magistra Apta on 14/01/24.
//

import Foundation

final class GameMapper {
    
    static func mapGameResponsesToEntities(
      input gameResponses: [GameEntryResponse]
    ) -> [GameEntity] {
      return gameResponses.map { result in
        let newGame = GameEntity()
          newGame.id = result.id
          newGame.name = result.name
          newGame.slug = result.slug
          newGame.backgroundImage = result.backgroundImage
          newGame.released = result.released
          newGame.rating = result.rating
        return newGame
      }
    }

    static func mapGameEntitiesToDomains(
      input gameEntities: [GameEntity]
    ) -> [GameModel] {
      return gameEntities.map { result in
          return GameModel(id: result.id, slug: result.slug, name: result.name, released: result.released, backgroundImage: result.backgroundImage, rating: result.rating)
      }
    }

    static func mapGameResponsesToDomains(
      input categoryResponses: [GameEntryResponse]
    ) -> [GameModel] {

      return categoryResponses.map { result in
          return GameModel(id: result.id, slug: result.slug, name: result.name, released: result.released, backgroundImage: result.backgroundImage, rating: result.rating)
          
      }
    }
    
    static func mapEntityToDomain(input gameEntity: GameEntity) -> GameModel {
        return GameModel(id: gameEntity.id, slug: gameEntity.slug, name: gameEntity.name, released: gameEntity.released, backgroundImage: gameEntity.backgroundImage, rating: gameEntity.rating)
    }
    
}
