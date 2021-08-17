//
//  CircleButton.swift
//  Mobile_ThanVanThanh
//
//  Created by Thân Văn Thanh on 17/08/2021.
//

import UIKit

class CircleButton: UIButton {
  
  let iconImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.translatesAutoresizingMaskIntoConstraints = false
    imageView.image = UIImage(named: "plusIcon")
    imageView.backgroundColor = .clear
    return imageView
  }()

  override init(frame: CGRect) {
    super.init(frame: frame)
    self.backgroundColor = UIColor(hexString: "66A8FB")
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func layoutSubviews() {
    setupView()
    setupLayout()
  }
  
  func setupView() {
    self.addSubview(iconImageView)
  }
  
  func setupLayout() {
    iconImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 0).isActive = true
    iconImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0).isActive = true
    iconImageView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.5).isActive = true
    iconImageView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.5).isActive = true
  }
}
