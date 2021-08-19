//
//  CreatTransactionViewController.swift
//  Mobile_ThanVanThanh
//
//  Created by Thân Văn Thanh on 18/08/2021.
//

import UIKit

class CreatTransactionViewController: UIViewController {
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Title"
        return label
    }()
    
    let titleTextField: UITextField = {
       let title = UITextField()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.placeholder = "Title"
        title.layer.borderWidth = 1
        title.layer.cornerRadius = 5
        title.layer.borderColor = UIColor(hexString: "66A8FB").cgColor
        return title
    }()
    
    let amountLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Amount"
        return label
    }()
    
    let amountTextField: UITextField = {
       let label = UITextField()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.placeholder = "Amount"
        label.layer.borderWidth = 1
        label.layer.cornerRadius = 5
        label.layer.borderColor = UIColor(hexString: "66A8FB").cgColor
        return label
    }()
    
    let dateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Date"
        return label
    }()
    let dateTextField: UITextField = {
       let date = UITextField()
        date.translatesAutoresizingMaskIntoConstraints = false
        date.placeholder = "When"
        date.layer.borderWidth = 1
        date.layer.cornerRadius = 5
        date.layer.borderColor = UIColor(hexString: "66A8FB").cgColor
        return date
    }()
    
    let saveButton: UIButton = {
       let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Save", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .blue
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 5
        button.layer.borderColor = UIColor(hexString: "66A8FB").cgColor
        return button
    }()
    let pickDate = UIDatePicker()
    var creatTranst: ((Received) -> Void)?
        override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupNavigation()
            setupView()
            setupLayout()
            setDatePicker()
            setupAction()
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
    // MARK: - SetupView
    func setupView() {
        view.addSubview(titleTextField)
        view.addSubview(amountTextField)
        view.addSubview(dateTextField)
        view.addSubview(titleLabel)
        view.addSubview(amountLabel)
        view.addSubview(dateLabel)
        view.addSubview(saveButton)
    }
    
    // MARK: SeupLayout
    func setupLayout() {
        titleLabel.bottomAnchor.constraint(equalTo: titleTextField.topAnchor, constant: -5).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: titleTextField.leadingAnchor, constant: 0).isActive = true
        
        titleTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        titleTextField.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 50).isActive = true
        titleTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        titleTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        
        amountLabel.bottomAnchor.constraint(equalTo: amountTextField.topAnchor, constant: -5).isActive = true
        amountLabel.leadingAnchor.constraint(equalTo: amountTextField.leadingAnchor, constant: 0).isActive = true
        
        amountTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        amountTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        amountTextField.topAnchor.constraint(equalTo: titleTextField.bottomAnchor, constant: 50).isActive = true
        amountTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        dateLabel.bottomAnchor.constraint(equalTo: dateTextField.topAnchor, constant: -5).isActive = true
        dateLabel.leadingAnchor.constraint(equalTo: dateTextField.leadingAnchor, constant: 0).isActive = true
        
        dateTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        dateTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        dateTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        dateTextField.topAnchor.constraint(equalTo: amountTextField.bottomAnchor, constant: 50).isActive = true
        
        saveButton.topAnchor.constraint(equalTo: dateTextField.bottomAnchor, constant: 50).isActive = true
        saveButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        saveButton.widthAnchor.constraint(equalTo: dateTextField.widthAnchor, multiplier: 0.5).isActive = true
        saveButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    func setDatePicker() {
        
        pickDate.datePickerMode = .date
        if #available(iOS 14.0, *) {
            pickDate.preferredDatePickerStyle = .wheels
        } else {
            // Fallback on earlier versions
        }
        dateTextField.inputView = pickDate
        pickDate.setDate(Date(), animated: true)
        let toolBar = UIToolbar()
        dateTextField.inputAccessoryView = toolBar
        toolBar.sizeToFit()
        
        dateLabel.text = "Date"
        
        let doneButton = UIBarButtonItem(title: "Chọn", style: .plain, target: self, action: #selector(doneDateAction))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: self, action: nil)
        let label = UIBarButtonItem(customView: dateLabel)
        let cancelButton = UIBarButtonItem(title: "Huỷ", style: .plain, target: self, action: #selector(cancelAction))
        
        toolBar.setItems([cancelButton, spaceButton, label, spaceButton, doneButton], animated: false)
        
        pickDate.addTarget(self, action: #selector(valueChangeDatePicker), for: .valueChanged)
    }
    @objc func valueChangeDatePicker() {
        dateLabel.text = ConvertHelper.stringFromDate(date: pickDate.date, format: "dd/MM/yyyy")
        dateLabel.sizeToFit()
    }
    @objc func cancelAction() {
        self.view.endEditing(true)
    }
    @objc func doneDateAction() {
        dateTextField.text = ConvertHelper.stringFromDate(date: pickDate.date, format: "dd/MM/yyyy")
        self.view.endEditing(true)
    }
    func setupAction() {
        saveButton.addTarget(self, action: #selector(ontapSave), for: .touchUpInside)
    }
    
    @objc func ontapSave() {
        creatTranst?(Received(dateTime: dateTextField.text ?? "", index: 0, content: titleTextField.text ?? "", transValue: amountTextField.text ?? "", type: 1))
        dismiss(animated: true, completion: nil)
    }
}
