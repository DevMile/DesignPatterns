//
//  ObserverPatternViewController.swift
//  DesignPatterns
//
//  Created by Milan Bojic on 5/7/19.
//  Copyright © 2019 Milan Bojic. All rights reserved.
//  CODE EXAMPLES USED FROM TUTORIAL AT: https://www.appcoda.com/

import UIKit

// By adopting the ObservedProtocol, this view controller gains the capability for broadcasting notifications via NotificationCenter to ANY entities throughout this WHOLE APP whom are interested in receiving those notifications.

class ObserverPatternViewController: UIViewController, ObservedProtocol {
    
    @IBOutlet weak var topBox: UIView!
    @IBOutlet weak var middleBox: UIView!
    @IBOutlet weak var bottomBox: UIView!
    
    // ObservedProtocol conformance -- two properties.
    let statusKey: StatusKey = .networkStatusKey
    let notification: Notification.Name = .networkConnection
    
    // Mock up three entities whom are dependent upon a critical resource: network connectivity. They need to observe the status of the critical resource.
    var networkConnectionHandler0: NetworkConnectionHandler?
    var networkConnectionHandler1: NetworkConnectionHandler?
    var networkConnectionHandler2: NetworkConnectionHandler?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Here are three entities now listening for notifications
        networkConnectionHandler0 = NetworkConnectionHandler(view: topBox)
        networkConnectionHandler1 = NetworkConnectionHandler(view: middleBox)
        networkConnectionHandler2 = NetworkConnectionHandler(view: bottomBox)
    }
    
    @IBAction func switchChanged(_ sender: Any) {
        let networkSwitch: UISwitch = sender as! UISwitch
        if networkSwitch.isOn {
            notifyObservers(about: NetworkConnectionStatus.connected.rawValue)
        } else {
            notifyObservers(about: NetworkConnectionStatus.disconnected.rawValue)
        }
    }
}
