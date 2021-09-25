//
//  ViewController.swift
//  AnimationDemo
//
//  Created by Norhan Boghdadi on 9/23/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .black

        


        addloading1()
        addLoading2()
        
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + .seconds(3), execute: { () -> Void in
            self.addHiddenLayer()

        } )
        
        
    }
    
    func addloading1() {
        
        
        let shapeLayer = CAShapeLayer()

        shapeLayer.position = view.center
        shapeLayer.lineCap = CAShapeLayerLineCap.round
        shapeLayer.lineWidth = 5
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.strokeColor = UIColor.blue.cgColor

        shapeLayer.path = UIBezierPath(arcCenter: .zero, radius: 50, startAngle: (CGFloat.pi) * 1.5, endAngle: (CGFloat.pi) * 2, clockwise: true).cgPath
        
        view.layer.addSublayer(shapeLayer)
        
        
        let start = CGPoint(x: shapeLayer.position.x, y: (shapeLayer.position.y) - 50)
        let end = CGPoint(x: (shapeLayer.position.x) + 50, y: (shapeLayer.position.y))
        
        
        let arrow = UIBezierPath()
        arrow.addArrow(start: start, end: end, pointerLineLength: 10, arrowAngle: CGFloat(Double.pi / 6))

        let arrowLayer = CAShapeLayer()
        arrowLayer.strokeColor = UIColor.blue.cgColor
        arrowLayer.lineWidth = 5
        arrowLayer.path = arrow.cgPath
        arrowLayer.fillColor = UIColor.clear.cgColor
        arrowLayer.lineJoin = CAShapeLayerLineJoin.round
        arrowLayer.lineCap = CAShapeLayerLineCap.round
        view.layer.addSublayer(arrowLayer)

        // animation

        let animation = CABasicAnimation(keyPath: #keyPath(CAShapeLayer.strokeEnd))
        animation.fromValue = 0
        animation.toValue = 1
        animation.duration = 3
        arrowLayer.add(animation, forKey: #keyPath(CAShapeLayer.strokeEnd))
        shapeLayer.add(animation, forKey: #keyPath(CAShapeLayer.strokeEnd))
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + .seconds(3)) {
            shapeLayer.isHidden = true
            arrowLayer.isHidden = true
        }

    }
    func addLoading2(){
        let shapeLayer = CAShapeLayer()

        shapeLayer.position = view.center
        shapeLayer.lineCap = CAShapeLayerLineCap.round
        shapeLayer.lineWidth = 5
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.strokeColor = UIColor.blue.cgColor

        shapeLayer.path = UIBezierPath(arcCenter: .zero, radius: 50, startAngle: (CGFloat.pi) / 2, endAngle: (CGFloat.pi) , clockwise: true).cgPath
        
        view.layer.addSublayer(shapeLayer)
        
        
        let start = CGPoint(x: shapeLayer.position.x, y: (shapeLayer.position.y) + 50)
        let end = CGPoint(x: (shapeLayer.position.x) - 50, y: (shapeLayer.position.y))
        
        
        let arrow = UIBezierPath()
        arrow.addArrow(start: start, end: end, pointerLineLength: 10, arrowAngle: CGFloat(Double.pi / 6))

        let arrowLayer = CAShapeLayer()
        arrowLayer.strokeColor = UIColor.blue.cgColor
        arrowLayer.lineWidth = 5
        arrowLayer.path = arrow.cgPath
        arrowLayer.fillColor = UIColor.clear.cgColor
        arrowLayer.lineJoin = CAShapeLayerLineJoin.round
        arrowLayer.lineCap = CAShapeLayerLineCap.round
        view.layer.addSublayer(arrowLayer)

        // animation

        let animation = CABasicAnimation(keyPath: #keyPath(CAShapeLayer.strokeEnd))
        animation.fromValue = 0
        animation.toValue = 1
        animation.duration = 3
        arrowLayer.add(animation, forKey: #keyPath(CAShapeLayer.strokeEnd))
        shapeLayer.add(animation, forKey: #keyPath(CAShapeLayer.strokeEnd))
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + .seconds(3)) {
            shapeLayer.isHidden = true
            arrowLayer.isHidden = true
        }

    }
    
    func addHiddenLayer() {
        let hiddenLayer = CAShapeLayer()

        hiddenLayer.position = view.center
        hiddenLayer.lineCap = CAShapeLayerLineCap.round
        hiddenLayer.lineWidth = 5
        hiddenLayer.fillColor = UIColor.clear.cgColor
        hiddenLayer.strokeColor = UIColor.white.cgColor
        
        hiddenLayer.path = UIBezierPath(arcCenter: .zero, radius: 50, startAngle: 0, endAngle: (CGFloat.pi) * 2 , clockwise: true).cgPath
        
        view.layer.addSublayer(hiddenLayer)
        
        var start = CGPoint(x: (hiddenLayer.position.x) + 20, y: (hiddenLayer.position.y) - 20)
        var end = CGPoint(x: (hiddenLayer.position.x) - 20, y: (hiddenLayer.position.y) + 20)
        
        let correct = UIBezierPath()
        correct.addCorrect(start: start, end: end, pointerLineLength: 15, arrowAngle: 45)
        
        let correctLayer = CAShapeLayer()
        correctLayer.strokeColor = UIColor.blue.cgColor
        correctLayer.lineWidth = 5
        correctLayer.path = correct.cgPath
        correctLayer.fillColor = UIColor.clear.cgColor
        correctLayer.strokeColor = UIColor.white.cgColor
        correctLayer.lineJoin = CAShapeLayerLineJoin.round
        correctLayer.lineCap = CAShapeLayerLineCap.round
        correctLayer.isHidden = true
        view.layer.addSublayer(correctLayer)
        
        let animation = CABasicAnimation(keyPath: "lineWidth")
        animation.fromValue = 5
        animation.toValue = 20
//        hiddenLayer.lineWidth = 30
        animation.duration = 1
        hiddenLayer.strokeColor = UIColor.green.cgColor
        hiddenLayer.fillColor = UIColor.green.cgColor
        correctLayer.isHidden = false

        hiddenLayer.add(animation, forKey: "animation")
        
        
    }
    

}





extension UIBezierPath {
    func addArrow(start: CGPoint, end: CGPoint, pointerLineLength: CGFloat, arrowAngle: CGFloat) {
        
//        self.move(to: start)
//        self.addLine(to: end)
        self.move(to: end)
    

        // MARK: - THIS PART calculates the top of the arrow
        
//        let startEndAngle = atan((end.y - start.y) / (end.x - start.x)) + ((end.x - start.x) < 0 ? CGFloat(Double.pi) : 0)
        
        var startEndAngle = 0
        
        if(end.x > start.x) {
            
            startEndAngle = -30
        }
        else {
            startEndAngle = 30
        }
        
        
        let arrowLine1 = CGPoint(x: end.x + pointerLineLength * cos(CGFloat(Double.pi) - CGFloat(startEndAngle) + arrowAngle), y: end.y - pointerLineLength * sin(CGFloat(Double.pi) - CGFloat(startEndAngle) + arrowAngle))
        
        
        let arrowLine2 = CGPoint(x: end.x + pointerLineLength * cos(CGFloat(Double.pi) - CGFloat(startEndAngle) - arrowAngle), y: end.y - pointerLineLength * sin(CGFloat(Double.pi) - CGFloat(startEndAngle) - arrowAngle))
        
// MARK: - These ones draw it.
        
            
        self.addLine(to: arrowLine1)
        self.move(to: end)
        self.addLine(to: arrowLine2)
    }
    
    
    
    func addCorrect(start: CGPoint, end: CGPoint, pointerLineLength: CGFloat, arrowAngle: CGFloat) {
        
        self.move(to: start)
        self.addLine(to: end)
        
        let startEndAngle = atan((end.y - start.y) / (end.x - start.x)) + ((end.x - start.x) < 0 ? CGFloat(Double.pi) : 0)
        
        let arrowLine1 = CGPoint(x: end.x + pointerLineLength * cos(CGFloat(Double.pi) - CGFloat(startEndAngle) + arrowAngle), y: end.y - pointerLineLength * sin(CGFloat(Double.pi) - CGFloat(startEndAngle) + arrowAngle))

        
        self.addLine(to: arrowLine1)
    }
}
 
