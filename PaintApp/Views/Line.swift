//
//  TouchPointAndColor.swift
//  PaintApp
//
//  Created by Aida Moldaly on 11.06.2022.
//


import UIKit


struct Object {
    var points: [(CGPoint, CGPoint)]
    var color: UIColor
    var isFilled: Bool
    var shapes: Shapes
}

enum Shapes {
    case pen
    case line
    case triangle
    case rectangle
    case circle
}
