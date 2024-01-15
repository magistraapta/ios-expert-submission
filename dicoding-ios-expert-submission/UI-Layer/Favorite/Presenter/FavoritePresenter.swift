//
//  FavoritePresenter.swift
//  dicoding-ios-expert-submission
//
//  Created by Magistra Apta on 15/01/24.
//

import Foundation
import Combine

class FavoritePresenter: ObservableObject {
    
    private var cancellables: Set<AnyCancellable> = []
    private let favoriteUsecase: FavoriteUseCase
    
    @Published var games: [GameModel] = []
    @Published var isLoading: Bool = false
    @Published var isError: Bool = false
    @Published var errorMessage: String = ""
    
    
    init(favoriteUsecase: FavoriteUseCase) {
        self.favoriteUsecase = favoriteUsecase
    }
    
    func getFavoriteGames() {
        isLoading = true
        favoriteUsecase.getFavoriteGames()
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    self.isLoading = false
                case .failure(let error):
                    self.errorMessage = error.localizedDescription
                    self.isError = true
                }
            }, receiveValue: { games in
                self.games = games
            })
            .store(in: &cancellables)
    }
}
