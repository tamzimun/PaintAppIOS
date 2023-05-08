//
//  TouchPointAndColor.swift
//  PaintApp
//
//  Created by tamzimun on 11.06.2022.
//


import UIKit

enum ShapeType {
    case pen
    case line
    case triangle
    case rectangle
    case circle
    
    var factory: ShapeFactory {
        switch self {
        case .line:
            return LineFactory()
        case .circle:
            return CircleFactory()
        case .pen:
            return LineFactory()
        case .rectangle:
            return RectangleFactory()
        case .triangle:
            return TriangleFactory()
        }
    }
}

struct ShapeViewModel {
    var points: [(fromPoint: CGPoint, toPoint: CGPoint)]
    var color: UIColor
    var isFilled: Bool
    var type: ShapeType
}

struct ShapeConfiguration {
    let startPoint: CGPoint
    let endPoint: CGPoint  
    let isFilled: Bool
    let linewidth: CGFloat = 2.0
    let color: UIColor
}


