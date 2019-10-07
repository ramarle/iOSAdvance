//
//  UserDAO.swift
//  CursoiOSAdvance
//
//  Created by Dev2 on 04/10/2019.
//  Copyright © 2019 Raul Martin. All rights reserved.
//
import Foundation
import RealmSwift

class UserDAO: Object {
    
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
    
    convenience init(uuid: String, avatar: String? = nil, firstname: String? = nil, lastname: String? = nil, gender: String? = nil, country: String? = nil, latitude: String? = nil, longitude: String? = nil, email: String? = nil, birthdate: Date? = nil){
        
        self.init()
        
        self.uuid = uuid
        self.avatar = avatar
        self.firstname = firstname
        self.lastname = lastname
        self.gender = gender
        self.country = country
        self.latitude = latitude
        self.longitude = longitude
        self.email = email
        self.birthdate = birthdate
        
    }
    
}
