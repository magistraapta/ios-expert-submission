//
//  HomePresenter.swift
//  dicoding-ios-expert-submission
//
//  Created by Magistra Apta on 14/01/24.
//

import Foundation
import Combine
import SwiftUI


class HomePresenter: ObservableObject {
    
    private var cancellables: Set<AnyCancellable> = []
    private let homeUseCase: HomeUseCase
    private var router = HomeRouter()
    
    @Published var games: [GameModel] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String = ""
    
    init(homeUseCase: HomeUseCase){
        self.homeUseCase = homeUseCase
    }
    
    func getGames() {
        isLoading = true
        homeUseCase.getGames()
        .receive(on: RunLoop.main)
        .sink(receiveCompletion: { completion in
          switch completion {
          case .failure:
            self.errorMessage = String(describing: completion)
          case .finished:
            self.isLoading = false
          }
        }, receiveValue: { games in
          self.games = games
        })
        .store(in: &cancellables)
    }
    
    func linkBuilder<Content: View>(for game: GameModel, @ViewBuilder content: () -> Content) -> some View {
        NavigationLink(destination: router.makeDetailView(for: game)) {
            content()
        }
    }
}
