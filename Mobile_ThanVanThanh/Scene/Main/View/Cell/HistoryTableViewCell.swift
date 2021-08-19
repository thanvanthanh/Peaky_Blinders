//
//  HistoryTableViewCell.swift
//  Mobile_ThanVanThanh
//
//  Created by Thân Văn Thanh on 16/08/2021.
//

import UIKit

class HistoryTableViewCell: UITableViewCell {
    
    let lineView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red: 0.93, green: 0.95, blue: 0.95, alpha: 1.00)
        return view
    }()
    
    let pointView: CircleView = {
        let view = CircleView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let bigPointView: CircleView = {
      let view = CircleView()
      view.translatesAutoresizingMaskIntoConstraints = false
      view.layer.opacity = 0.15
      return view
    }()
    
    let tradingLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.text = "Payment orders"
        label.font = .boldSystemFont(ofSize: 16)
        label.textColor = UIColor(red: 0.19, green: 0.24, blue: 0.24, alpha: 1.00)
        return label
    }()

    let timeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "16/08/2021"
        label.font = .systemFont(ofSize: 12)
        label.textColor = UIColor(red: 0.70, green: 0.75, blue: 0.74, alpha: 1.00)
        return label
    }()
    
    let monneyLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "1.000.000"
        label.font = .boldSystemFont(ofSize: 18)
        return label
    }()
    var data = DataLoader().transData
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        setupView()
        setupLayout()
        
        // Configure the view for the selected state
    }
    // MARK: - SetupView
    func setupView() {
        self.addSubview(lineView)
        self.addSubview(pointView)
        self.addSubview(bigPointView)
        self.addSubview(tradingLabel)
        self.addSubview(timeLabel)
        self.addSubview(monneyLabel)
    }
    
    // MARK: - setupLayout
    func setupLayout() {
        lineView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        lineView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15).isActive = true
        lineView.widthAnchor.constraint(equalToConstant: 3).isActive = true
        lineView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
        
        pointView.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0).isActive = true
        pointView.centerXAnchor.constraint(equalTo: lineView.centerXAnchor, constant: 0).isActive = true
        pointView.widthAnchor.constraint(equalToConstant: 10).isActive = true
        pointView.heightAnchor.constraint(equalToConstant: 10).isActive = true
        
        bigPointView.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0).isActive = true
        bigPointView.centerXAnchor.constraint(equalTo: lineView.centerXAnchor, constant: 0).isActive = true
        bigPointView.widthAnchor.constraint(equalToConstant: 30).isActive = true
        bigPointView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        tradingLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0).isActive = true
        tradingLabel.leadingAnchor.constraint(equalTo: bigPointView.trailingAnchor, constant: 8).isActive = true
        tradingLabel.heightAnchor.constraint(equalToConstant: 16).isActive = true
//        tradingLabel.trailingAnchor.constraint(lessThanOrEqualTo: monneyLabel.trailingAnchor, constant: 10).isActive = true
        
        timeLabel.topAnchor.constraint(equalTo: tradingLabel.bottomAnchor, constant: 8).isActive = true
        timeLabel.leadingAnchor.constraint(equalTo: tradingLabel.leadingAnchor, constant: 0).isActive = true
        timeLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 12).isActive = true
        timeLabel.widthAnchor.constraint(greaterThanOrEqualToConstant: 16).isActive = true
        timeLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8).isActive = true
        
        monneyLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0).isActive = true
        monneyLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5).isActive = true
        
        monneyLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }

}
