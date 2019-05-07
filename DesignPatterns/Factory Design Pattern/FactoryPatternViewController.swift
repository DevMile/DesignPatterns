//
//  ViewController.swift
//  DesignPatterns
//
//  Created by Milan Bojic on 5/1/19.
//  Copyright © 2019 Milan Bojic. All rights reserved.
//  CODE EXAMPLES USED FROM TUTORIAL AT: https://www.appcoda.com/

import UIKit

class FactoryPatternViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func makeCircle(_ sender: Any) {
        hideSubview()
        createShape(.circle, on: view)
    }
    
    @IBAction func makeSquare(_ sender: Any) {
        hideSubview()
        createShape(.square, on: view)
    }
    
    @IBAction func makeRectangle(_ sender: Any) {
        hideSubview()
        createShape(.rectangle, on: view)
    }
    
    func hideSubview() {
        for i in 1...3 {
            view.viewWithTag(i)?.removeFromSuperview()
        }
    }
}

