//
//  LineFactory.swift
//  PaintApp
//
//  Created by Aida Moldaly on 30.06.2022.
//

import UIKit

final class LineFactory: ShapeFactory {
    func create(configuration: ShapeConfiguration) -> UIBezierPath {
        
        let path = UIBezierPath()
        path.move(to: configuration.startPoint)
        path.addLine(to: configuration.endPoint)
        path.setUp(
            with: configuration.color,
            linewidth: configuration.linewidth,
            isFilled: configuration.isFilled)
        
        return path
    }
}
