//
//  ObservedObjectTemplate.swift
//  DesignPatterns
//
//  Created by Milan Bojic on 5/7/19.
//  Copyright © 2019 Milan Bojic. All rights reserved.
//  CODE EXAMPLES USED FROM TUTORIAL AT: https://www.appcoda.com/

import Foundation

// An template for a subject, usually a single critical resource, that broadcasts notifications about a change in its state to many subscribers that depend on that resource.
protocol ObservedProtocol {
    var statusKey: StatusKey { get }
    var notification: Notification.Name { get }
    func notifyObservers(about changeTo: String) -> Void
}

// When an adopter of this ObservedProtocol changes status, it notifies ALL subsribed observers. It BROADCASTS to ALL SUBSCRIBERS.
extension ObservedProtocol {
    
    func notifyObservers(about changeTo: String) -> Void {
        NotificationCenter.default.post(name: notification, object: self, userInfo: [statusKey.rawValue : changeTo])
    }
    
}
