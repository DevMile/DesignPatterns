//
//  AdapterPatternExample.swift
//  DesignPatterns
//
//  Created by Milan Bojic on 5/11/19.
//  Copyright © 2019 Milan Bojic. All rights reserved.
//

import Foundation

enum Directories: String {
    case Documents = "Documents"
    case Temp = "tmp"
}

protocol DirectoryNames {
    func documentsDirectoryURL() -> URL
    
    func tempDirectoryURL() -> URL
}

extension DirectoryNames {
    func documentsDirectoryURL() -> URL {
        return FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    }
    
    func tempDirectoryURL() -> URL {
        return FileManager.default.temporaryDirectory
    }
}

// A dedicated adapter
struct iOSFile: DirectoryNames {
    let fileName: URL
    var fullPathInDocuments: String {
        return documentsDirectoryURL().appendingPathComponent(fileName.absoluteString).path
    }
    var fullPathInTemporary: String {
        return tempDirectoryURL().appendingPathComponent(fileName.absoluteString).path
    }
    var documentsStringPath: String {
        return documentsDirectoryURL().path
    }
    var temporaryStringPath: String {
        return tempDirectoryURL().path
    }
    
    init(fileName: String) {
        self.fileName = URL(string: fileName)!
    }
}

// PROTOCOL-ORIENTED APPROACH
protocol AppDirectoryAndFileStringPathNamesAdapter: DirectoryNames {
    
    var fileName: String { get }
    var workingDirectory: Directories { get }
    
    func documentsDirectoryStringPath() -> String
    
    func tempDirectoryStringPath() -> String
    
    func fullPath() -> String
    
} // end protocol AppDirectoryAndFileStringPathAdpaterNames
extension AppDirectoryAndFileStringPathNamesAdapter {
    
    func documentsDirectoryStringPath() -> String {
        return documentsDirectoryURL().path
    }
    
    func tempDirectoryStringPath() -> String {
        return tempDirectoryURL().path
    }
    
    func fullPath() -> String {
        switch workingDirectory {
        case .Documents:
            return documentsDirectoryStringPath() + "/" + fileName
        case .Temp:
            return tempDirectoryStringPath() + "/" + fileName
        }
    }
    
} // end extension AppDirectoryAndFileStringPathNamesAdpater

struct AppDirectoryAndFileStringPathNames: AppDirectoryAndFileStringPathNamesAdapter {
    
    let fileName: String
    let workingDirectory: Directories
    
    init(fileName: String, workingDirectory: Directories) {
        self.fileName = fileName
        self.workingDirectory = workingDirectory
    }
    
} // end struct AppDirectoryAndFileStringPathNames

