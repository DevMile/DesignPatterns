//
//  MementoProtocol.swift
//  DesignPatterns
//
//  Created by Milan Bojic on 5/8/19.
//  Copyright © 2019 Milan Bojic. All rights reserved.
//  CODE EXAMPLES USED FROM TUTORIAL AT: https://www.appcoda.com/

import Foundation

protocol Memento: class {
    // Key for accessing the "state" property from UserDefaults.
    var stateName: String {get}
    // Current state of adopting class
    var state: [String:String] {get set}
    
    func save()
    func restore()
    func persist()
    func recover()
    func show()
}

extension Memento {
    // Save state into dictionary archived on disk.
    func save() {
        UserDefaults.standard.set(state, forKey: stateName)
    }
    
    // Read state from dictionary archived on disk.
    func restore() {
        if let dictionary = UserDefaults.standard.object(forKey: stateName) as? [String:String] {
            state = dictionary
        } else {
            state.removeAll()
        }
    }
    
    func show() {
        var line = ""
        if state.count > 0 {
            for (key, value) in state {
                line += key + ": " + value + "\n"
                print(line)
            }
        } else {
            print("Empty entity.\n")
        }
    }
}
