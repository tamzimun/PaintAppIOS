//
//  StateShapesMomento.swift
//  PaintApp
//
//  Created by Aida Moldaly on 30.06.2022.
//

import Foundation

protocol Momento {
    var shapesArray: [ShapeViewModel] { get }
}

class StateShapesMomento: Momento {
    private(set) var shapesArray: [ShapeViewModel]
    
    init(shapes: [ShapeViewModel]) {
        self.shapesArray = shapes
    }
}
