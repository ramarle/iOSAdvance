//
//  DataManager.swift
//  CursoiOSAdvance
//
//  Created by Dev2 on 04/10/2019.
//  Copyright © 2019 Raul Martin. All rights reserved.
//

import Foundation

class DataManager {
    
    static let shared = DataManager()
    
    private init() {
        
    }
    
    func users(completion: ServiceCompletion) {
        
        let users = usersDB()
        if users.count > 0{
            //
            completion(.success(data: users))
        } else {
            usersForceUpdate(completion: completion)
        }
    }
    
    func usersForceUpdate(completion: ServiceCompletion) {
        
        //Llamar al servico para obtener nuevos users
        ApiManager.shared.fetchUsers() { result in
            
            switch result {
                
                case.success(let data):
                    
                    guard let users = data as? UsersDTO else {
                        completion(.failure(msg: "Error genérico"))
                        return
                    }
                    
                    DatabaseManager.shared.deleteAll()
                    save(users: users)
                    completion(.success(data: users))
                    break
                    
                case.failure(let msg):
                    print ("Fallo al obtener usuarios del servicio: \(msg)")
                    completion(.failure(msg: msg))
                    break
            }
            
        }
        
    }
    
    func user(id:String) -> UserDAO?{
        return DatabaseManager.shared.user(by: id)
    }
    
    private func usersDB() -> Array<UserDAO>{
        
        return Array(DatabaseManager.shared.users())
    }
    
    private func save(users: UsersDTO){
        guard let usersToSave = users.users else {
            return
        }
        
        usersToSave.forEach{save(user: $0)}
    }
    
    private func save(user: UserDTO){
        
        guard let userId = user.login?.uuid else {
            return
        }
        
        let userDB = UserDAO(uuid: userId, avatar: user.picture?.large, firstname: user.name?.first, lastname: user.name?.last, gender: user.gender, country: user.location?.country, latitude: user.coordinates?.latitude, longitude: user.coordinates?.longitude, email: user.email, birthdate: user.dob?.date)
        
        DatabaseManager.shared.save(user: userDB)
    }
}
