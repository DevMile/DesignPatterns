//
//  SingletonPatternViewController.swift
//  DesignPatterns
//
//  Created by Milan Bojic on 5/2/19.
//  Copyright © 2019 Milan Bojic. All rights reserved.
//  CODE EXAMPLES USED FROM TUTORIAL AT: https://www.appcoda.com/

import UIKit

class SingletonPatternViewController: UIViewController {

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var visiblePasswordSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if UserPreferences.shared.isPasswordVisible() {
            visiblePasswordSwitch.isOn = true
            passwordTextField.isSecureTextEntry = false
        } else {
            visiblePasswordSwitch.isOn = false
            passwordTextField.isSecureTextEntry = true
        }
    }
    
    @IBAction func pressedVisiblePasswordSwitch(_ sender: Any) {
        if let passwordVisible = sender as? UISwitch {
            if passwordVisible.isOn {
                passwordTextField.isSecureTextEntry = false
                UserPreferences.shared.setPasswordVisibility(true)
            } else {
                passwordTextField.isSecureTextEntry = true
                UserPreferences.shared.setPasswordVisibility(false)
            }
        }
    }
    

}
