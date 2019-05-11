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
        
        //MARK: - ADAPTER PATTERN EXAMPLE
        
        // A dedicated adapter approach
        let iOSfile = iOSFile(fileName: "myFile.txt")
        print("ADAPTER PATTERN PRINT RESULTS:\n" + "----------------------------" + "\n" + "File path in Documents:\n" + iOSfile.fullPathInDocuments + "\n" + "Documents folder path:\n" + iOSfile.documentsStringPath + "\n\n" + "File path in Temporary folder:\n" + iOSfile.fullPathInTemporary + "\n" + "Temporary folder path:\n" + iOSfile.temporaryStringPath + "\n")
        // We STILL have access to URLs through protocol DirectoryNames.
        print("------------------" + "\n" + "URLs:\n")
        print(iOSfile.documentsDirectoryURL())
        print(iOSfile.tempDirectoryURL())
        
        // Protocol-oriented approach
        print("\n" + "------------------" + "\n" + "ADAPTER PATTERN PROTOCOL-ORIENTED APPROACH PRINT RESULTS:\n")
        let appFileDocumentsDirectoryPaths = AppDirectoryAndFileStringPathNames(fileName: "newFile.txt", workingDirectory: .Documents)
        print("File path in Documents:\n" + appFileDocumentsDirectoryPaths.fullPath() + "\n" + "Documents folder path:\n" + appFileDocumentsDirectoryPaths.documentsDirectoryStringPath() + "\n")
        print("URL path:")
        print(appFileDocumentsDirectoryPaths.documentsDirectoryURL())
        
        print("\n" + "------------------" + "\n" + "END ADAPTER PATTERN\n" + "------------------" + "\n")
        // END ADAPTER PATTERN
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
