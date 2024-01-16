//
//  GameEntity.swift
//  dicoding-ios-expert-submission
//
//  Created by Magistra Apta on 14/01/24.
//

import Foundation
import RealmSwift

class GameEntity: Object {
    
    @objc dynamic var id = 0
    @objc dynamic var name = ""
    @objc dynamic var backgroundImage = ""
    @objc dynamic var slug = ""
    @objc dynamic var released = ""
    @objc dynamic var rating = 0.0
    @objc dynamic var favorite = false
    
    
    
    override static func primaryKey() -> String? {
        return "id"
    }
}
