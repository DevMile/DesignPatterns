//
//  ShapeFactory.swift
//  DesignPatterns
//
//  Created by Milan Bojic on 5/1/19.
//  Copyright © 2019 Milan Bojic. All rights reserved.
//  CODE EXAMPLES USED FROM TUTORIAL AT: https://www.appcoda.com/

// MARK: - FACTORY DESIGN PATTERN

import UIKit

let defaultHeight = 200
let defaultColor = #colorLiteral(red: 0.01680417731, green: 0.1983509958, blue: 1, alpha: 1)

protocol ViewFactoryProtocol {
    func configure()
    func position()
    func display()
    var height: Int {get}
    var view: UIView {get}
    var parentView: UIView {get}
}

// Square
fileprivate class Square: ViewFactoryProtocol {
    var height: Int
    var view: UIView
    var parentView: UIView
    
    init(height: Int = defaultHeight, parentView: UIView) {
        self.height = height
        self.parentView = parentView
        self.view = UIView()
    }
    
    func configure() {
        let frame = CGRect(x: 0, y: 0, width: height, height: height)
        view.frame = frame
        view.backgroundColor = defaultColor
        view.tag = 1
    }
    
    func position() {
        view.center = parentView.center
    }
    
    func display() {
        configure()
        position()
        parentView.addSubview(view)
    }
}

// Circle
fileprivate class Circle: Square {
    override func configure() {
        super.configure()
        view.layer.cornerRadius = view.frame.width / 2
        view.layer.masksToBounds = true
        view.tag = 2
    }
}

// Rectangle
fileprivate class Rectangle: Square {
    override func configure() {
        let frame = CGRect(x: 0, y: 0, width: height + height/2, height: height)
        view.frame = frame
        view.backgroundColor = defaultColor
        view.tag = 3
    }
}

// MARK: - SHAPE FACTORY

enum Shapes: String {
    case square, circle, rectangle
}

class ShapeFactory {
    
    var parentView: UIView
    
    init(parentView: UIView) {
        self.parentView = parentView
    }
    
    func create(as shape: Shapes) -> ViewFactoryProtocol {
        switch shape {
        case .square:
            let square = Square(parentView: parentView)
            return square
        case .circle:
            let circle = Circle(parentView: parentView)
            return circle
        case .rectangle:
            let rectangle = Rectangle(parentView: parentView)
            return rectangle
        }
    }
}

// MARK: - Public methods

func createShape(_ shape: Shapes, on view: UIView) {
    let shapeFactory = ShapeFactory(parentView: view)
    shapeFactory.create(as: shape).display()
}

func getShape(_ shape: Shapes, on view: UIView) -> ViewFactoryProtocol {
    let shapeFactory = ShapeFactory(parentView: view)
    return shapeFactory.create(as: shape)
}
