//
//  NetworkConnectionHandler.swift
//  DesignPatterns
//
//  Created by Milan Bojic on 5/7/19.
//  Copyright © 2019 Milan Bojic. All rights reserved.
//  CODE EXAMPLES USED FROM TUTORIAL AT: https://www.appcoda.com/

import Foundation
import UIKit

// Various network connection states -- made consistent.
enum NetworkConnectionStatus: String {
    case connected, disconnected, connecting, disconnecting, error
}

// An example of an observer, usually one of many that are all listening for notifications from some usually single critical resource.
class NetworkConnectionHandler: Observer {
    var view: UIView
    
    init(view: UIView) {
        self.view = view
        super.init(statusKey: StatusKey.networkStatusKey, notificationOfInterest: Notification.Name.networkConnection)
    }
    
    override func handleNotification() {
        if statusValue == NetworkConnectionStatus.connected.rawValue {
            view.backgroundColor = .green
        } else {
            view.backgroundColor = .red
        }
    }
}
