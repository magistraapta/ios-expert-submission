//
//  HomeView.swift
//  dicoding-ios-expert-submission
//
//  Created by Magistra Apta on 14/01/24.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var vm: HomePresenter = .init(homeUseCase: Injection.init().provideHome())
    var body: some View {
        List{
            ForEach(vm.games){ item in
                vm.linkBuilder(for: item) {
                    GameRow(game: item)
                }
                
            }
        }
        .listStyle(.plain)
        .onAppear{
            vm.getGames()
        }
        .navigationTitle("game list")
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

