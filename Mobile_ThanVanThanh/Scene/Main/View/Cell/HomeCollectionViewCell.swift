//
//  HomeCollectionViewCell.swift
//  Mobile_ThanVanThanh
//
//  Created by Thân Văn Thanh on 16/08/2021.
//

import UIKit

class HomeCollectionViewCell: UICollectionViewCell {
    
    var percentage: Float?
    
    let containerView: UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let percentageView: PercentageCircleView = {
        let view = PercentageCircleView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let typeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 18)
        label.text = "Current balance"
        label.numberOfLines = 0
        label.textColor = UIColor(red: 0.19, green: 0.24, blue: 0.24, alpha: 1.00)
        return label
    }()
    
    let moneyLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textColor = UIColor(red: 0.51, green: 0.56, blue: 0.56, alpha: 1.00)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Setup View
    func setupView() {
        self.addSubview(containerView)
        containerView.addSubview(percentageView)
        containerView.addSubview(moneyLabel)
        containerView.addSubview(typeLabel)
    }
    
    // Setup Layout
    func setupLayout() {
        containerView.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 0).isActive = true
        containerView.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0).isActive = true
        containerView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.8).isActive = true
        containerView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.8).isActive = true
        
        percentageView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 0).isActive = true
        percentageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 0).isActive = true
        percentageView.heightAnchor.constraint(equalTo: containerView.heightAnchor, multiplier: 0.5).isActive = true
        percentageView.widthAnchor.constraint(equalTo: containerView.heightAnchor, multiplier: 0.5).isActive = true
        
        typeLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 0).isActive = true
        typeLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: 0).isActive = true
        typeLabel.leadingAnchor.constraint(equalTo: percentageView.trailingAnchor, constant: 10).isActive = true
        typeLabel.heightAnchor.constraint(equalTo: containerView.heightAnchor, multiplier: 0.6).isActive = true
        
        
        moneyLabel.topAnchor.constraint(equalTo: typeLabel.bottomAnchor, constant: 8).isActive = true
        moneyLabel.leadingAnchor.constraint(equalTo: percentageView.trailingAnchor, constant: 8).isActive = true
        moneyLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: 0).isActive = true
        moneyLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: 0).isActive = true
    }
}
