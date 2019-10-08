//
//  User.swift
//  CursoiOSAdvance
//
//  Created by Dev2 on 08/10/2019.
//  Copyright © 2019 Raul Martin. All rights reserved.
//

import Foundation

class User {
    
    let id: String
    let avatar: String?
    let firstname: String?
    let lastname: String?
    let email: String?
    let country: String?
    let birthdate: Date?
    let nationality: String?
    
    var name: String {
        return "\(String(describing: firstname)) \(String(describing: lastname))"
    }
    
    var age: Int {
        
        guard let date = birthdate else {
            return 0
        }
        
        let ageComponent = Calendar.current.dateComponents([.year], from: date, to: Date())
        
        return ageComponent.year ?? 0
    }
    
    init(id: String, avatar: String? = nil, firstname: String? = nil, lastname: String? = nil, email: String? = nil, country: String? = nil, birthdate: Date? = nil, nationality: String? = nil){
    
        self.id = id
        self.avatar = avatar
        self.firstname = firstname
        self.lastname = lastname
        self.email = email
        self.country = country
        self.birthdate = birthdate
        self.nationality = nationality
    }
}
