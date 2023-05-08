//
//  ShapeFactory.swift
//  PaintApp
//
//  Created by tamzimun on 30.06.2022.
//

import UIKit

protocol ShapeFactory {
    func create(configuration: ShapeConfiguration) -> UIBezierPath
}

extension UIBezierPath {
    func setUp(with color: UIColor, linewidth: CGFloat, isFilled: Bool) {
        color.setStroke()
        if isFilled {
            color.setFill()
            fill()
        }
        
        self.lineWidth = linewidth
    }
}
