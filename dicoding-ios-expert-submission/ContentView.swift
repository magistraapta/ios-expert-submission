//
//  ContentView.swift
//  dicoding-ios-expert-submission
//
//  Created by Magistra Apta on 13/01/24.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var homePresenter: HomePresenter
    @EnvironmentObject var favoritePresenter: FavoritePresenter
    var body: some View {
        NavigationStack {
            TabView {
                HomeView(vm: homePresenter)
                    .tabItem {
                        Image(systemName: "house")
                    }
                FavoriteView()
                    .tabItem {
                        Image(systemName: "house")
                    }
                
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(HomePresenter(homeUseCase: Injection.init().provideHome()))
            .environmentObject(FavoritePresenter(favoriteUseCase: Injection.init().provideFavorite()))
    }
}
