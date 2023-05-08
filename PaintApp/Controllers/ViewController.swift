//
//  ViewController.swift
//  PaintApp
//
//  Created by tamzimun on 10.06.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet var canvasView: CanvasView!
    
    var carrierState: CarrierState!
    
    var colors2: [UIColor] = [.blue, .red, .green, .brown, .darkGray, .orange, .purple, .systemPink, .yellow]

    @IBAction func circleButton(_ sender: UIButton) {
        canvasView.shapeType = .circle
    }
    
    @IBAction func rectangleButton(_ sender: UIButton) {
        canvasView.shapeType = .rectangle
    }
    
    @IBAction func lineButton(_ sender: UIButton) {
        canvasView.shapeType = .line
    }
    
    @IBAction func triangleButton(_ sender: UIButton) {
        canvasView.shapeType = .triangle
    }
    
    @IBAction func penButton(_ sender: UIButton) {
        canvasView.shapeType = .pen
    }
    
    @IBAction func fillButton(_ sender: UISwitch) {
        if sender .isOn {
            canvasView.isFilled = true
        } else {
            canvasView.isFilled = false
        }
    }
    
    @IBAction func returnBackButton(_ sender: UIButton) {
        canvasView.undo()
    }
    
    @IBAction func goForwardButton(_ sender: UIButton) {
        canvasView.redo()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
    }
}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return colors2.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        if let backView = cell.viewWithTag(0) {
            backView.backgroundColor = colors2[indexPath.row]
            backView.layer.cornerRadius = 3
        }
        
        return cell
        
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        canvasView.color = colors2[indexPath.row]
    }
}
