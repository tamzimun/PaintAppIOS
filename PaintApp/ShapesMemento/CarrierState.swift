//
//  CarrierState.swift
//  PaintApp
//
//  Created by Aida Moldaly on 30.06.2022.
//

import Foundation

class CarrierState {
    
    var states: [Momento] = []
    var canvasView: CanvasView
    var currentIndex: Int = 0
    
    init(canvasView: CanvasView) {
        self.canvasView = canvasView
    }
    
    func save() {
        let tail = (states.count) - 1 - currentIndex
        if tail > 0 { states.removeLast(tail) }
        
        states.append(canvasView.save())
        currentIndex = (states.count) - 1
    }
    
    func undo(steps: Int) {
        guard steps <= currentIndex else { return }
        
        currentIndex -= steps
        canvasView.restore(state: (states[currentIndex]))
    }
    
    func redo(steps: Int) {
        let newIndex = currentIndex + steps
        guard newIndex < states.count else { return }
        
        currentIndex = newIndex
        canvasView.restore(state: states[currentIndex])
    }
}
