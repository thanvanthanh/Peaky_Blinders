//
//  CreatTransactionViewController.swift
//  Mobile_ThanVanThanh
//
//  Created by Thân Văn Thanh on 18/08/2021.
//

import UIKit

class CreatTransactionViewController: UIViewController {
    
        override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
        setupNavigation()
        // Do any additional setup after loading the view.
    }
    func setupNavigation() {
        navigationController?.navigationBar.barTintColor = UIColor(hexString: "66A8FB")
        let leftButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(cancel))
        leftButton.tintColor = .white
        navigationItem.leftBarButtonItem = leftButton
    }
    
    @objc func cancel() {
        navigationController?.dismiss(animated: true, completion: {})
    }
}
