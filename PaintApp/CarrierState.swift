//
//  CarrierState.swift
//  PaintApp
//
//  Created by Aida Moldaly on 30.06.2022.
//

import Foundation

class CarrierState {
    
    var state: StateShapesMomento?
    var shapesManager: ShapesManager
    
    init(shapesManager: ShapesManager) {
        self.shapesManager = shapesManager
    }
    
    func saveLine() {
        state = shapesManager.save()
        print("my state is \(state)")
    }
    
    func loadShape() {
        guard state != nil else { return }
        shapesManager.load(state: state!)
    }
}
