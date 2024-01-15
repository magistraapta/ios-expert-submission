//
//  GameEntity.swift
//  dicoding-ios-expert-submission
//
//  Created by Magistra Apta on 14/01/24.
//

import Foundation
import RealmSwift

class GameEntity: Object {
    @objc dynamic var id: Int = 0
    @objc dynamic var name: String = ""
    @objc dynamic var backgroundImage: String = ""
    @objc dynamic var slug: String = ""
    @objc dynamic var released: String = ""
    @objc dynamic var rating: Double = 0.0
    @objc dynamic var favorite: Bool = false
    
    override static func primaryKey() -> String? {
        return "id"
    }
}
