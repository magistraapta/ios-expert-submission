//
//  LocaleDataSource.swift
//  dicoding-ios-expert-submission
//
//  Created by Magistra Apta on 14/01/24.
//

import Foundation
import Combine
import RealmSwift

protocol LocaleDataSourceProtocol {
    func getGames() -> AnyPublisher<[GameEntity], Error>
    func addGames(from games: [GameEntity]) -> AnyPublisher<Bool, Error>
//    func getFavoriteGames() -> AnyPublisher<[GameEntity], Error>
//    func updateFavorite(id: Int) -> AnyPublisher<GameEntity, Error>
}

class LocaleDataSource: NSObject {
    private let realm: Realm?
    private init(realm: Realm?) {
        self.realm = realm
    }
    
    static let sharedInstance: (Realm?) -> LocaleDataSource = {
        realmDatabase in return LocaleDataSource(realm: realmDatabase)
    }
    
}


extension LocaleDataSource: LocaleDataSourceProtocol {
    
    func getGames() -> AnyPublisher<[GameEntity], Error> {
        return Future<[GameEntity], Error> { completion in
          if let realm = self.realm {
            let games: Results<GameEntity> = {
              realm.objects(GameEntity.self)
                .sorted(byKeyPath: "name", ascending: true)
            }()
              completion(.success(games.toArray(ofType: GameEntity.self)))
          } else {
              completion(.failure(DatabaseError.InvalidInstance))
          }
        }.eraseToAnyPublisher()
      }
    
    func addGames(from games: [GameEntity]) -> AnyPublisher<Bool, Error> {
        return Future<Bool, Error> { completion in
          if let realm = self.realm {
            do {
              try realm.write {
                for game in games {
                  realm.add(game, update: .all)
                }
                completion(.success(true))
              }
            } catch {
              completion(.failure(DatabaseError.requestFailed))
            }
          } else {
              completion(.failure(DatabaseError.InvalidInstance))
          }
        }.eraseToAnyPublisher()
    }
    
//    func getFavoriteGames() -> AnyPublisher<[GameEntity], Error> {
//        return Future<[GameEntity], Error> { completion in
//            if let realm = self.realm {
//                let gameEntities = {
//                    realm.objects(GameEntity.self)
//                        .filter("favorite = \(true)")
//                        .sorted(byKeyPath: "name", ascending: true)
//                }()
//                completion(.success(gameEntities.toArray(ofType: GameEntity.self)))
//            } else {
//                completion(.failure(DatabaseError.InvalidInstance))
//            }
//        }.eraseToAnyPublisher()
//    }
//
//    func updateFavorite(id: Int) -> AnyPublisher<GameEntity, Error> {
//        return Future<GameEntity, Error> { completion in
//            if let realm = self.realm, let gameEntity = {
//                realm.objects(GameEntity.self).filter("id = \(id)")
//            }().first {
//                do {
//                    try realm.write {
//                        gameEntity.setValue(!gameEntity.favorite, forKey: "favorite")
//                    }
//                    completion(.success(gameEntity))
//                } catch {
//                    completion(.failure(DatabaseError.requestFailed))
//                }
//            } else {
//                completion(.failure(DatabaseError.InvalidInstance))
//            }
//        }.eraseToAnyPublisher()
//    }
    
    
}

extension Results {

  func toArray<T>(ofType: T.Type) -> [T] {
    var array = [T]()
    for index in 0 ..< count {
      if let result = self[index] as? T {
        array.append(result)
      }
    }
    return array
  }

}
