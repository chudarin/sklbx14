//
//  CDTodoTaskViewController.swift
//  Skillbox_14
//
//  Created by Sergey Chudarin on 23.03.2020.
//  Copyright © 2020 Sergey Chudarin. All rights reserved.
//

import UIKit
import CoreData

protocol CDTodoTaskViewControllerDelegate {
    func saveTask(taskName: String)
    func reloadData()
}

class CDTodoTaskViewController: UIViewController {
    
    var delegate: CDTodoTaskViewControllerDelegate?
    
    @IBOutlet weak var taskNameTextField: UITextField!
    @IBAction func addTaskNameButton(_ sender: Any) {
        delegate?.saveTask(taskName: taskNameTextField.text!)
        delegate?.reloadData()
        dismiss(animated: true, completion: nil)
    }
    @IBOutlet weak var addtaskNameButton2: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        taskNameTextField.becomeFirstResponder()
        addtaskNameButton2.layer.cornerRadius = addtaskNameButton2.frame.size.height / 2
    }

}
