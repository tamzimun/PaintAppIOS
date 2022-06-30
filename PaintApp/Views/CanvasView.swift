//
//  CanvasView2.swift
//  PaintApp
//
//  Created by Aida Moldaly on 15.06.2022.
//
import UIKit

class CanvasView: UIView {

    private var finishedLines = [Object]()
    var color: UIColor = .black
    var shape: Shapes = .pen
    var isFilled: Bool = false
    
    
    func drawLine(first: CGPoint, end: CGPoint, path: inout UIBezierPath){
        path.move(to: first)
        path.addLine(to: end)
    }
    
    func drawRectangle(first: CGPoint, end: CGPoint, path: inout UIBezierPath){
        let width = end.x - first.x
        let height = end.y - first.y
        path = UIBezierPath(rect: CGRect(x: first.x, y: first.y, width: width, height: height))
    }
    
    func drawTriangle(first: CGPoint, end: CGPoint, path: inout UIBezierPath){
        path.move(to: CGPoint(x: first.x, y: first.y))
        path.addLine(to: CGPoint(x: first.x, y: end.y))
        path.addLine(to: CGPoint(x: end.x, y: end.y))
        path.close()
    }
    
    func drawCircle(first: CGPoint, end: CGPoint, path: inout UIBezierPath){
        let width = end.x - first.x
        let height = end.y - first.y
        path = UIBezierPath(ovalIn: CGRect(x: first.x, y: first.y, width: width, height: height))
    }

    override func draw(_ rect: CGRect) {
        
        finishedLines.forEach { line in
            line.color.setStroke()
            
            line.points.forEach { first, end in
                
                var path = UIBezierPath()
                
                switch line.shapes {
                case .pen: drawLine(first: first, end: end, path: &path)
                case .line: drawLine(first: first, end: end, path: &path)
                case .rectangle: drawRectangle(first: first, end: end, path: &path)
                case .triangle: drawTriangle(first: first, end: end, path: &path)
                case .circle: drawCircle(first: first, end: end, path: &path)
                }
                
                if line.isFilled {
                    line.color.setFill()
                    path.fill()
                }
                
                path.lineWidth = 3
                path.stroke()
                
            }
        }
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        guard var firstPoint = touches.first?.location(in: nil) else { return }
        
        firstPoint.y -= 80
        
        let line = Object(points:[(firstPoint, firstPoint)], color: color, isFilled: isFilled, shapes: shape)
        finishedLines.append(line)
        setNeedsDisplay()
    }

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        guard var currantPoint = touches.first?.location(in: nil) else { return }
        currantPoint.y -= 80
        
        guard var lastObject = finishedLines.popLast() else { return }
        guard var endPoint = lastObject.points.popLast() else { return }
        
        endPoint.1 = currantPoint
        lastObject.points.append(endPoint)
        
        if lastObject.shapes == .pen {
            lastObject.points.append((currantPoint, currantPoint))
        }
        finishedLines.append(lastObject)
        setNeedsDisplay()
    }
    
    func backCanvasView() {
        _ = finishedLines.popLast()
        setNeedsDisplay()
    }
}
