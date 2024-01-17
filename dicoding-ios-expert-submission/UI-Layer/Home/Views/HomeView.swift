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
        VStack {
            Text("Game List")
                .font(.title)
                .bold()
            Spacer()
            if vm.games.isEmpty {
                VStack{
                    Image("error-image")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 300)
                    Text("No data")
                }
            } else {
                List{
                    ForEach(vm.games){ item in
                        vm.linkBuilder(for: item) {
                            GameRow(game: item)
                        }
                        
                    }
                }
                .listStyle(.plain)
            }
            Spacer()
        }
        .onAppear{
            vm.getGames()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

