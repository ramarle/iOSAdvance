//
//  DatabaseManager.swift
//  CursoiOSAdvance
//
//  Created by Dev2 on 07/10/2019.
//  Copyright © 2019 Raul Martin. All rights reserved.
//

import Foundation
import RealmSwift

class DatabaseManager {
    
    static let shared = DatabaseManager()
    
    private init() {}
    
    private let realm = try! Realm()
    
    func save(user: UserDAO) {
        
        try! realm.write {
            realm.add(user, update: .modified)
        }
    }
    
    func users() -> Results<UserDAO>{
        return realm.objects(UserDAO.self)
    }
    
    func user(by id: String) -> UserDAO? {

        return realm.object(ofType: UserDAO.self, forPrimaryKey: id)
    }
    
    func deleteAll(){
        try! realm.write {
            realm.deleteAll()
        }
        
    }
    
    func delete(user: UserDAO){
        realm.delete(user)
        try! realm.write {
            realm.delete(user)
        }
    }
}
