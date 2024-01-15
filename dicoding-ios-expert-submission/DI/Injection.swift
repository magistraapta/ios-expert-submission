//
//  Injection.swift
//  dicoding-ios-expert-submission
//
//  Created by Magistra Apta on 14/01/24.
//

import Foundation
import RealmSwift

class Injection: NSObject {
    
    private func provideRepository() -> GameRepositoryProtocol {
        let realm = try? Realm()
        
        let locale: LocaleDataSource = LocaleDataSource.sharedInstance(realm)
        let remote: RemoteDataSource = RemoteDataSource.sharedInstance
        
        return GameRepository.sharedInstance(locale, remote)
    }
    
    func provideHome() -> HomeUseCase {
        let repo = provideRepository()
        return HomeInteractor(repository: repo)
    }
    
    func provideDetail(game: GameModel) -> DetailUseCase {
        let repository = provideRepository()
        return DetailInteractor(repository: repository, game: game)
    }
    
    
}
