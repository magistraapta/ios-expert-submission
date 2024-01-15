//
//  dicoding_ios_expert_submissionApp.swift
//  dicoding-ios-expert-submission
//
//  Created by Magistra Apta on 13/01/24.
//

import SwiftUI

@main
struct dicoding_ios_expert_submissionApp: App {
    let homePresenter = HomePresenter(homeUseCase: Injection.init().provideHome())
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(homePresenter)
        }
    }
}
