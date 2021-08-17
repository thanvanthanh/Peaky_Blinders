//
//  PercentageCircleView.swift
//  Mobile_ThanVanThanh
//
//  Created by Thân Văn Thanh on 16/08/2021.
//

import UIKit

class PercentageCircleView: UIView {

    var percentage: Float?
    var lineColor: UIColor?
    var circleShapeLayer: CAShapeLayer?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        draw()
        self.displayPercentage(percentage: self.percentage!)
        self.animateCircle(duration: 2.0)
    }
    
    func draw() {
        let path = UIBezierPath(roundedRect: CGRect(x: 2.5, y: 2.5, width: self.bounds.height - 5, height: self.bounds.height - 5),
                                cornerRadius: (self.bounds.width - 5) / 2)
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        shapeLayer.lineWidth = 5
        shapeLayer.strokeColor = UIColor(red: 0.90, green: 0.93, blue: 0.95, alpha: 1.00).cgColor
        shapeLayer.fillColor = UIColor.white.cgColor
        self.layer.addSublayer(shapeLayer)
    }
    
    func displayPercentage(percentage: Float) {
        let startPoint = -CGFloat(Float.pi / 2)
        let endPoint = -CGFloat(Float.pi / 2) + CGFloat(Float.pi * 2 * percentage)
        let path = UIBezierPath(arcCenter: CGPoint(x: self.bounds.width / 2, y: self.bounds.height / 2), radius: (self.bounds.width - 5) / 2,
                                startAngle: startPoint, endAngle: endPoint, clockwise: true)
        circleShapeLayer = CAShapeLayer()
        circleShapeLayer!.path = path.cgPath
        circleShapeLayer!.lineWidth = 5
        circleShapeLayer!.strokeColor = lineColor?.cgColor
        circleShapeLayer!.fillColor = UIColor.clear.cgColor
        circleShapeLayer!.lineCap = CAShapeLayerLineCap.round
        circleShapeLayer!.strokeEnd = 0.0
        self.layer.addSublayer(circleShapeLayer!)
    }
    
    func animateCircle(duration: TimeInterval) {
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.duration = duration
        animation.fromValue = 0
        animation.toValue = 1
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut)
        
        circleShapeLayer?.strokeEnd = 1.0
        circleShapeLayer?.add(animation, forKey: "animateCircle")
    }
}
