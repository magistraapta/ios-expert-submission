//
//  GameModel.swift
//  dicoding-ios-expert-submission
//
//  Created by Magistra Apta on 14/01/24.
//

import Foundation

struct GameModel: Equatable, Identifiable {
    let id: Int
    let slug, name, released: String
    let backgroundImage: String
    let rating: Double
    var favorite: Bool = false
}
