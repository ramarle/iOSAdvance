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
    
    func users(completion: @escaping ServiceCompletion) {
        
        DispatchQueue.global(qos: .background).async { [weak self] in
            if let users = self?.usersDB(), users.count > 0{
                //
                DispatchQueue.main.async {
                    completion(.success(data: users))
                }
                
            } else {
                self?.usersForceUpdate(completion: completion)
            }
        }
        
    }
    
    //Con @escaping almacenamos el parámetro en memoria aunque la funcion termine ya que los necesitamos para el clousure
    func usersForceUpdate(completion: @escaping ServiceCompletion) {
        
        //Creamos un hilo en background
        DispatchQueue.global(qos: .background).async {
            //weak self nos permite gestionar la memoria
            ApiManager.shared.fetchUsers() { [weak self] result in
                switch result {
                    case.success(let data):
                        guard let usersDTO = data as? UsersDTO else {
                            DispatchQueue.main.async {
                                completion(.failure(msg: "Error genérico"))
                            }
                            
                            return
                        }
                        
                        DatabaseManager.shared.deleteAll()
                        self?.save(users: usersDTO)
                        
                        let users = usersDTO.users?.compactMap{ userDTO in
                            self?.fromUserDTOToUser(userDTO: userDTO)
                        }
                        
                        DispatchQueue.main.async {
                            completion(.success(data: users))
                        }
                        

                    case.failure(let msg):
                        print ("Fallo al obtener usuarios del servicio: \(msg)")
                        
                        DispatchQueue.main.async {
                            completion(.failure(msg: msg))

                        }
                }
            }
        }
    }
    
    func user(id:String, completion: @escaping ServiceCompletion){
        
        DispatchQueue.global(qos: .background).async { [weak self] in
            
            if let userDAO = DatabaseManager.shared.user(by: id) {
                
                let user = self!.fromUserDAOToUser(userDAO: userDAO)
                DispatchQueue.main.async {
                    completion(.success(data: user))
                }
                
            } else {
                
                DispatchQueue.main.async {
                    completion(.failure(msg: "No se ha encontrado el usuario"))
                }
                
            }
        }
    }
    
    private func usersDB() -> Array<User>{
        
        var users = Array<User>()
        
        DatabaseManager.shared.users().forEach { userDAO in
            
            users.append(fromUserDAOToUser(userDAO: userDAO))
        }
        
        return users
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
    
    private func fromUserDAOToUser(userDAO: UserDAO) -> User{
        
        return User(id: userDAO.uuid, avatar: userDAO.avatar, firstname: userDAO.firstname, lastname: userDAO.lastname, email: userDAO.email, country: userDAO.country, birthdate: userDAO.birthdate, nationality: nil)
        
    }
    
    private func fromUserDTOToUser(userDTO: UserDTO) -> User{
        
        if let uuid = userDTO.login?.uuid {
            
            return User(id: uuid, avatar: userDTO.picture?.large, firstname: userDTO.name?.first, lastname: userDTO.name?.last, email: userDTO.email, country: userDTO.location?.country, birthdate: userDTO.dob?.date, nationality: userDTO.location?.country)
            
        } else {
            
            return User(id: "0")
            
        }
        
    }
}
