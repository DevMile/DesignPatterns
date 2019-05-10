//
//  FacadeViewController.swift
//  DesignPatterns
//
//  Created by Milan Bojic on 5/10/19.
//  Copyright © 2019 Milan Bojic. All rights reserved.
//  CODE EXAMPLES USED FROM TUTORIAL AT: https://www.appcoda.com/

import UIKit

class FacadeViewController: UIViewController {
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var headlineField: UITextField!
    
    var documentsDirectory = iOSAppFileSystemDirectory(using: .Documents)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        documentsDirectory.list()
    }
    
    @IBAction func saveText(_ sender: Any) {
        if textField.text != "" && headlineField.text != "" {
            documentsDirectory.writeFile(containing: textField.text!, withName: headlineField.text! + ".txt")
        } else {
            documentsDirectory.writeFile(containing: "You must enter text.", withName: "error.txt")
        }
    }
    
    @IBAction func deleteFile(_ sender: Any) {
        if headlineField.text != "" {
            documentsDirectory.deleteFile(withName: headlineField.text! + ".txt")
        }
    }
    
    @IBAction func readFile(_ sender: Any) {
        if headlineField.text != "" {
            let read = documentsDirectory.readFile(withName: headlineField.text! + ".txt")
            textView.text = read
        } else {
            let read = documentsDirectory.readFile(withName: "error.txt")
            textView.text = read
        }
    }

}
