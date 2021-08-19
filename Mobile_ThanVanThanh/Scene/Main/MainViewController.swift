//
//  MainViewController.swift
//  Mobile_ThanVanThanh
//
//  Created by Thân Văn Thanh on 16/08/2021.
//

import UIKit
import RxSwift
import RxCocoa

class MainViewController: UIViewController {
    
    let data = DataLoader().transData
    let dataWidth = WidthLoader().withdrawnData
    
    let quarterCircleView: QuarterCircleView = {
        let view = QuarterCircleView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.isScrollEnabled = false
        collection.backgroundColor = .white
        collection.layer.cornerRadius = 8
        collection.layer.shadowOffset = CGSize(width: 0, height: 10)
        collection.layer.shadowRadius = 10
        collection.layer.shadowColor = UIColor(hexString: "87BDFD").cgColor
        collection.layer.shadowOpacity = 0.25
        collection.layer.masksToBounds = false
        collection.register(HomeCollectionViewCell.self, forCellWithReuseIdentifier: "HomeCollectionViewCell")
        return collection
    }()
    
    let stateSegmentedControl: StateSegmentedControl = {
        let segmentedControl = StateSegmentedControl(items: ["Money Received", "Money Withdrawn"])
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.backgroundColor = UIColor(hexString: "F6F9F9")
        segmentedControl.tintColor = UIColor(hexString: "66A8FB")
        segmentedControl.layer.borderColor = UIColor(hexString: "66A8FB").cgColor
        segmentedControl.layer.borderWidth = 1
        return segmentedControl
    }()
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = UIColor(hexString: "F6F9F9")
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.separatorStyle = .none
        tableView.register(HistoryTableViewCell.self, forCellReuseIdentifier: "HistoryTableViewCell")
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //        var data = DataLoader().transData
        //        print(data)
        setUpNavigation()
        setUpView()
        setUpLayout()
        setupCollectionView()
        view.backgroundColor = UIColor(hexString: "F6F9F9")
        stateSegmentedControl.addTarget(self, action: #selector(segmentedControlValueChanged(_:)), for: .valueChanged)
    }
    @objc fileprivate func segmentedControlValueChanged(_ sender: UISegmentedControl) {
        tableView.reloadData()
    }
    // MARK: - Navigation
    func setUpNavigation() {
        navigationController?.navigationBar.backgroundColor = .clear
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
    }
    
    // MARK: - Setup View
    func setUpView() {
        view.addSubview(quarterCircleView)
        view.addSubview(collectionView)
        view.addSubview(tableView)
        view.addSubview(stateSegmentedControl)
    }
    // MARK: - MockData
    
    // MARK: - Setup Layout
    
    func setUpLayout() {
        
        quarterCircleView.topAnchor.constraint(equalTo: view.topAnchor, constant: -90).isActive = true
        quarterCircleView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: -90).isActive = true
        quarterCircleView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1).isActive = true
        quarterCircleView.heightAnchor.constraint(equalTo: quarterCircleView.widthAnchor, multiplier: 1).isActive = true
        
        collectionView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 50).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
        collectionView.heightAnchor.constraint(equalTo: collectionView.widthAnchor, multiplier: 0.58).isActive = true
        
        stateSegmentedControl.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 30).isActive = true
        stateSegmentedControl.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        stateSegmentedControl.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8).isActive = true
        stateSegmentedControl.heightAnchor.constraint(equalToConstant: 32).isActive = true
        
        tableView.topAnchor.constraint(equalTo: stateSegmentedControl.bottomAnchor, constant: 10).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        
    }
    
    // MARK: - Setup CollectionView + TableView
    func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
}
// MARK: - Extension CollectionView
extension MainViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCollectionViewCell", for: indexPath) as? HomeCollectionViewCell else { return UICollectionViewCell() }
        cell.moneyLabel.text = "1.000.000"
        cell.percentageView.lineColor = .red
        switch indexPath.row {
        case 0:
            cell.percentageView.lineColor = UIColor(hexString: "7CC3AD")
            cell.percentageView.percentage = 0.95
        case 1:
            cell.percentageView.lineColor = UIColor(hexString: "F2B53A")
            cell.percentageView.percentage = 0.55
        case 2:
            cell.percentageView.lineColor = UIColor(hexString: "ED7190")
            cell.percentageView.percentage = 0.80
        default:
            cell.percentageView.lineColor = UIColor(hexString: "AC68FF")
            cell.percentageView.percentage = 0.90
        }
        return cell
    }
    
    
}
extension MainViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.frame.size.width - 1) / 2
        let height = (collectionView.frame.size.height - 1) / 2
        
        return CGSize(width: width, height: height)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
extension MainViewController: UICollectionViewDelegateFlowLayout {
    
}
// MARK: - Extension TableView
extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.isSelected = false
    }
}
extension MainViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let selectIndex = self.stateSegmentedControl.selectedSegmentIndex
        switch selectIndex {
        case 0:
            return data.count
        case 1:
            return dataWidth.count
        default:
            break
        }
        return 0
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "HistoryTableViewCell", for: indexPath) as? HistoryTableViewCell else { return UITableViewCell() }
        let selectIndex = self.stateSegmentedControl.selectedSegmentIndex
        switch selectIndex {
        case 0:
            cell.monneyLabel.text = "+ " + data[indexPath.row].transValue
            cell.timeLabel.text = data[indexPath.row].dateTime
            cell.tradingLabel.text = data[indexPath.row].content
            cell.monneyLabel.textColor = UIColor(hexString: "00237B")
        case 1:
            cell.monneyLabel.text = "- " + dataWidth[indexPath.row].transValue
            cell.timeLabel.text = dataWidth[indexPath.row].dateTime
            cell.tradingLabel.text = dataWidth[indexPath.row].content
            cell.monneyLabel.textColor = .red
        default:
            break
        }
        cell.separatorInset = UIEdgeInsets.zero
        cell.layoutMargins = UIEdgeInsets.zero
        return cell
    }
    
    
}
