//
//  ViewController.swift
//  Skillbox_14
//
//  Created by Sergey Chudarin on 19.03.2020.
//  Copyright © 2020 Sergey Chudarin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var fristNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    
    @objc func textFirstNameDidChange(_ textField: UITextField) {
        Persistance.shared.firstName = fristNameTextField.text!
    }
    @objc func textLastNameDidChange(_ textField: UITextField) {
        Persistance.shared.lastName = lastNameTextField.text!
   }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fristNameTextField.text = Persistance.shared.firstName
        lastNameTextField.text = Persistance.shared.lastName
        fristNameTextField.addTarget(self, action: #selector(ViewController.textFirstNameDidChange), for: .editingChanged)
        lastNameTextField.addTarget(self, action: #selector(ViewController.textLastNameDidChange), for: .editingChanged)
    }
}

