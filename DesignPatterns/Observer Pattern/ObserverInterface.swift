//
//  ObserverPattern.swift
//  DesignPatterns
//
//  Created by Milan Bojic on 5/7/19.
//  Copyright © 2019 Milan Bojic. All rights reserved.
//  CODE EXAMPLES USED FROM TUTORIAL AT: https://www.appcoda.com/

import Foundation

// This protocol forms the basic design for OBSERVERS, entities whose operation CRTICIALLY depends on the status of some other, usually single, entity. Adopters of this protocol SUBSCRIBE to and RECEIVE notifications about that critical entity/resource.
protocol ObserverProtocol {
    var statusValue: String {get}
    var statusKey: String {get}
    var notificationOfInterest: Notification.Name {get}
    func subscribe()
    func unsubscribe()
    func handleNotification()
}

// This template class abstracts out all the details necessary for an entity to SUBSCRIBE to and RECEIVE notifications about a critical entity/resource. It provides a "hook" (handleNotification()) in which subclasses of this base class can pretty much do whatever they need to do when specific notifications are received.
class Observer: ObserverProtocol {
    var statusValue: String
    let statusKey: String
    // The name of the notification this class has registered to receive whenever messages are broadcast.
    let notificationOfInterest: Notification.Name
    
    init(statusKey: StatusKey, notificationOfInterest: Notification.Name) {
        self.statusValue = "N/A"
        self.statusKey = statusKey.rawValue
        self.notificationOfInterest = notificationOfInterest
        subscribe()
    }
    
    func subscribe() {
        NotificationCenter.default.addObserver(self, selector: #selector(receiveNotification(_:)), name: notificationOfInterest, object: nil)
    }
    
    // It's a good idea to un-register from notifications when we no longer need to listen, but this is more of a historic curiosity as, since iOS 9.0, the OS does some type of cleanup.
    func unsubscribe() {
        NotificationCenter.default.removeObserver(self, name: notificationOfInterest, object: nil)
    }
    
    func handleNotification() {
        fatalError("ERROR: You must override the [handleNotification] method and customize it per your need.")
    }
    
    // Called whenever a message labelled "notificationOfInterest" is received.
    @objc func receiveNotification(_ notification: Notification) {
        if let userInfo = notification.userInfo, let status = userInfo[statusKey] as? String {
            statusValue = status
            handleNotification()
            print("Notification \(notification.name) received; status: \(status)")
        }
    }
    
    deinit {
        print("Observer unsubscribing from notifications.")
        unsubscribe()
    }
}

// Make notification names consistent and avoid stringly-typing.
extension Notification.Name {
    static let networkConnection = Notification.Name("networkConnection")
    static let batteryStatus = Notification.Name("batteryStatus")
    static let locationChange = Notification.Name("locationChange")
}

// The key to the notification's "userInfo" dictionary.
enum StatusKey: String {
    case networkStatusKey
}
