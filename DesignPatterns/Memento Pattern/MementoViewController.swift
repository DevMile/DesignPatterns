//
//  MementoViewController.swift
//  DesignPatterns
//
//  Created by Milan Bojic on 5/8/19.
//  Copyright © 2019 Milan Bojic. All rights reserved.
//

import UIKit

class MementoViewController: UIViewController {

    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var age: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func saveUserTapped(_ sender: Any) {
        if firstName.text != "" && lastName.text != "" && age.text != "" {
            let user = User(firstName: firstName.text!, lastName: lastName.text!, age: age.text!, stateName: "userKey")
            user.show()
        }
    }
    
    @IBAction func restoreUserTapped(_ sender: Any) {
        let user = User(stateName: "userKey")
        firstName.text = user.firstName
        lastName.text = user.lastName
        age.text = user.age
        user.show()
    }
}
