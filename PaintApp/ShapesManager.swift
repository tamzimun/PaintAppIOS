//
//  ShapesManager.swift
//  PaintApp
//
//  Created by Aida Moldaly on 30.06.2022.
//

import Foundation
import UIKit

class ShapesManager {
    
    static let shared = ShapesManager()
    
    var shapesArray = [ShapeViewModel]()
    
    func save() -> StateShapesMomento {
        return StateShapesMomento(shapes: self.shapesArray)
    }
    
    func load(state: StateShapesMomento) {
        self.shapesArray = state.shapesArray
    }
    
    func printShapes(in view: UIView) {
        for view in view.layer.sublayers! {
            view.removeFromSuperlayer()
            print("my view is here \(view)")
        }
        
        shapesArray.forEach { shape in
            shape.points.forEach { fromPoint, toPoint in
                let factory = shape.type.factory
                let configuration = ShapeConfiguration (
                    startPoint: fromPoint,
                    endPoint: toPoint,
                    isFilled: shape.isFilled,
                    color: shape.color)
                
                let path = factory.create(configuration: configuration)
                path.stroke()

            }
        }
    }
    
}
