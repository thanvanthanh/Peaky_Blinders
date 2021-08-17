//
//  File.swift
//  Mobile_ThanVanThanh
//
//  Created by Thân Văn Thanh on 16/08/2021.
//

import UIKit

class  StateSegmentedControl: UISegmentedControl {
    override open func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = self.bounds.size.height / 2.0
        self.backgroundColor = UIColor(red: 0.96, green: 0.98, blue: 0.98, alpha: 1.00)
    }
    
}
