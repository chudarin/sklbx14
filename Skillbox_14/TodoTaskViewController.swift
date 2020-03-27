//
//  TodoTaskViewController.swift
//  Skillbox_14
//
//  Created by Sergey Chudarin on 19.03.2020.
//  Copyright © 2020 Sergey Chudarin. All rights reserved.
//

import UIKit

protocol TodoTaskViewControllerDelegate {
    func reloadData()
}

class TodoTaskViewController: UIViewController {
    
    var delegate: TodoTaskViewControllerDelegate?
    
    
    @IBOutlet weak var taskNameTextField: UITextField!
    @IBAction func addTaskNameButton(_ sender: Any) {
        Persistance.shared.saveTask(name: taskNameTextField.text!, status: false)
        delegate?.reloadData()
        print("Task: \(taskNameTextField.text!) is sended!")
        dismiss(animated: true, completion: nil)
    }
    @IBOutlet weak var addtaskNameButton2: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        taskNameTextField.becomeFirstResponder()
        addtaskNameButton2.layer.cornerRadius = addtaskNameButton2.frame.size.height / 2
    }

}
