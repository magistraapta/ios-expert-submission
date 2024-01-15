//
//  RemoteDataSource.swift
//  dicoding-ios-expert-submission
//
//  Created by Magistra Apta on 13/01/24.
//

import Foundation
import Combine
import Alamofire

protocol RemoteDataSourceProtocol {
    func getGames() -> AnyPublisher<[GameEntryResponse], Error>
}

class RemoteDataSource: NSObject {
    private override init() { }
    
    static let sharedInstance: RemoteDataSource = RemoteDataSource()
}

extension RemoteDataSource: RemoteDataSourceProtocol {
    
    func getGames() -> AnyPublisher<[GameEntryResponse], Error> {
        return Future<[GameEntryResponse], Error> { completion in
            if let url = URL(string: "https://api.rawg.io/api/games?token&key=f26f41e3c0074fa68c798b02bae584a0&page=1") {
                AF.request(url)
                    .validate()
                    .responseDecodable(of: GameResponse.self) { response in
                        switch response.result {
                        case .success(let value):
                            completion(.success(value.results))
                        case .failure:
                            completion(.failure(URLError(.badServerResponse)))
                        }
                    }
            }
        }.eraseToAnyPublisher()
    }
    
}
