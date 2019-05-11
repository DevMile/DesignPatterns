//
//  iOSAppFileSystemDirectory.swift
//  DesignPatterns
//
//  Created by Milan Bojic on 5/10/19.
//  Copyright © 2019 Milan Bojic. All rights reserved.
//  CODE EXAMPLES USED FROM TUTORIAL AT: https://www.appcoda.com/

import Foundation

struct iOSAppFileSystemDirectory: AppFileManipulation, AppFileStatusChecking, AppFileSystemMetaData {
    
    
    let workingDirectory: AppDirectories
    
    init(using directory: AppDirectories) {
        self.workingDirectory = directory
    }
    
    func writeFile(containing text: String, withName name: String) {
        writeFile(containing: text, to: workingDirectory, withName: name)
    }
    
    func readFile(withName name: String) -> String {
        return readFile(at: workingDirectory, withName: name)
    }
    
    func deleteFile(withName name: String) {
        deleteFile(at: workingDirectory, withName: name)
    }
    
    func showAttributes(forFile named: String) -> Void {
        let fullPath = buildFullPath(forFileName: named, inDirectory: workingDirectory)
        let fileAttributes = attributes(ofFile: fullPath)
        for attribute in fileAttributes {
            print(attribute)
        }
    }
    
    func list() {
        list(directory: getURL(for: workingDirectory))
    }
    
}
