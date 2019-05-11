//
//  User.swift
//  DesignPatterns
//
//  Created by Milan Bojic on 5/8/19.
//  Copyright © 2019 Milan Bojic. All rights reserved.
//  CODE EXAMPLES USED FROM TUTORIAL AT: https://www.appcoda.com/

import Foundation

class User: Memento {
    // These two properties are required by Memento.
    let stateName: String
    var state: [String: String]
    
    // These properties are specific to a class that represents some kind of system user account.
    var firstName: String
    var lastName: String
    var age: String
    
    // Initializer for persisting a new user to disk, or for updating an existing user.
    init(firstName: String, lastName: String, age: String, stateName: String) {
        self.firstName = firstName
        self.lastName = lastName
        self.age = age
        
        self.stateName = stateName
        state = [String:String]()
        persist()
    }
    
    // Initializer for retrieving a user from disk, if one exists.
    init(stateName: String) {
        self.stateName = stateName
        state = [String:String]()
        
        firstName = ""
        lastName = ""
        age = ""
        recover()
    }
    
    func persist() {
        state["firstName"] = firstName
        state["lastName"] = lastName
        state["age"] = age
        save()
    }
    
    func recover() {
        restore()
        if state.count > 0 {
            firstName = state["firstName"]!
            lastName = state["lastName"]!
            age = state["age"]!
        } else {
            self.firstName = ""
            self.lastName = ""
            self.age = ""
        }
    }
}
