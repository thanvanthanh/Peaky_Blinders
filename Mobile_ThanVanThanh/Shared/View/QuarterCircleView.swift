//
//  QuarterCircleView.swift
//  Mobile_ThanVanThanh
//
//  Created by Thân Văn Thanh on 16/08/2021.
//

import UIKit

class QuarterCircleView: UIView {
    
    override init(frame: CGRect) {
      super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
      super.layoutSubviews()
      draw()
    }
    
    func draw() {
      let path = UIBezierPath(arcCenter: CGPoint(x: 0, y: 0), radius: self.bounds.maxX, startAngle: 0, endAngle: CGFloat(Float.pi / 2), clockwise: true)
      path.addLine(to: CGPoint(x: 0, y: 0))
      let shapeLayer = CAShapeLayer()
      shapeLayer.path = path.cgPath
      shapeLayer.fillColor = UIColor.blue.cgColor
      let gradientLayer = CAGradientLayer()
      gradientLayer.frame = self.bounds
      gradientLayer.mask = shapeLayer
      gradientLayer.colors = [UIColor(red: 0.40, green: 0.66, blue: 0.98, alpha: 1.00).cgColor, UIColor(red: 0.26, green: 0.81, blue: 0.62, alpha: 1.00).cgColor]
      gradientLayer.locations = [0.0, 1.0]
      self.layer.addSublayer(gradientLayer)
    }

}
