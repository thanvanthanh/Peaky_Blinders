//
//  CircleView.swift
//  Mobile_ThanVanThanh
//
//  Created by Thân Văn Thanh on 16/08/2021.
//

import UIKit

class CircleView: UIView {

    var color: UIColor {
      didSet {
        self.layer.removeFromSuperlayer()
        self.draw()
      }
    }

    override init(frame: CGRect) {
      color = UIColor(red: 0.83, green: 0.77, blue: 0.98, alpha: 1.00)
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
      let path = UIBezierPath(roundedRect: CGRect(x: 0, y: 0, width: self.bounds.width, height: self.bounds.height),
                              cornerRadius: self.bounds.width / 2)
      let shapeLayer = CAShapeLayer()
      shapeLayer.path = path.cgPath
      shapeLayer.fillColor = color.cgColor
      self.layer.addSublayer(shapeLayer)
      self.layer.masksToBounds = true
    }

}
