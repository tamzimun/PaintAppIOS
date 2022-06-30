//
//  StateShapesMomento.swift
//  PaintApp
//
//  Created by Aida Moldaly on 30.06.2022.
//

import Foundation

class StateShapesMomento {
    var shapesArray: [ShapeViewModel]
    
    init(shapes: [ShapeViewModel]) {
        self.shapesArray = shapes
        print("my shape array is \(shapes)")
    }
}
