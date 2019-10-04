//
//  UserDAO.swift
//  CursoiOSAdvance
//
//  Created by Dev2 on 04/10/2019.
//  Copyright © 2019 Raul Martin. All rights reserved.
//
import Foundation
import RealmSwift

class userDAO: Object {
    
    @objc dynamic var uuid:String = ""
    @objc dynamic var gender: String?
    @objc dynamic var firstname: String?
    @objc dynamic var lastname: String?
    @objc dynamic var country: String?
    @objc dynamic var latitude: String?
    @objc dynamic var longitude: String?
    @objc dynamic var email: String?
    @objc dynamic var birthdate: Date?
    @objc dynamic var avatar: String?
    
    override static func primaryKey() -> String {
        return "uuid"
    }
    
}
