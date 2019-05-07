//
//  PreferencesSingleton.swift
//  DesignPatterns
//
//  Created by Milan Bojic on 5/2/19.
//  Copyright © 2019 Milan Bojic. All rights reserved.
//  CODE EXAMPLES USED FROM TUTORIAL AT: https://www.appcoda.com/

import Foundation

// MARK: - Create Singleton wrapper around UserDefaults
class UserPreferences {
    
    // Create a static, constant instance of the enclosing class (itself) and initialize.
    static let shared = UserPreferences()
    
    // This is the private, shared resource we're protecting.
    private let userPreferences: UserDefaults
    
    // A private initializer can only be called by this class itself.
    private init() {
        // Get the iOS shared singleton. We're wrapping it here.
        userPreferences = UserDefaults.standard
    }
    
    // Keys
    enum Preferences {
        
        enum UserCredentials: String {
            case passwordVisible, password, username
        }
        
        enum AppState: String {
            case appFirstRun, dateLastRun, currentVersion
        }
    }
    
    // Methods
    func setBooleanForKey(_ boolean: Bool, key: String) {
        if key != "" {
            userPreferences.set(boolean, forKey: key)
        }
    }
    
    func getBooleanForKey(_ key: String) -> Bool {
        if let isBooleanValue = userPreferences.value(forKey: key) as! Bool? {
            print("Key \(key) is \(isBooleanValue)")
            return true
        } else {
            print("Key \(key) is false")
            return false
        }
    }
    
    func isPasswordVisible() -> Bool {
        let isVisible = userPreferences.bool(forKey: Preferences.UserCredentials.passwordVisible.rawValue)
        return isVisible
    }
    
    func setPasswordVisibility(_ visible: Bool) {
        userPreferences.set(visible, forKey: Preferences.UserCredentials.passwordVisible.rawValue)
    }
}
