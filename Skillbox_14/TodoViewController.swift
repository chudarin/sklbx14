//
//  TodoViewController.swift
//  Skillbox_14
//
//  Created by Sergey Chudarin on 19.03.2020.
//  Copyright © 2020 Sergey Chudarin. All rights reserved.
//

import UIKit

class TodoViewController: UIViewController {
    
    var tcVC: TodoTaskViewController?
    
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var addTaskButton: UIButton!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? TodoTaskViewController {
            tcVC = vc
            tcVC?.delegate = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func strikeThroughText (_ text:String) -> NSAttributedString {
        let attributeString: NSMutableAttributedString =  NSMutableAttributedString(string: text)
        attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 1, range: NSMakeRange(0, attributeString.length))
        return attributeString
    }

}


extension TodoViewController: TodoTaskViewControllerDelegate, UITableViewDataSource, UITableViewDelegate {
    
    func reloadData() {
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Persistance.shared.tasksCount()
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
      if editingStyle == .delete {
        Persistance.shared.deleteTask(id: indexPath.row)
        self.tableView.deleteRows(at: [indexPath], with: .automatic)
        self.tableView.reloadData()
      }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! TodoTableViewCell
//        cell.taskNum.text = String(indexPath.row + 1)
        cell.taskName.text = Persistance.shared.getTaskName(id: indexPath.row)
        if Persistance.shared.getTaskStatus(id: indexPath.row) {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if Persistance.shared.getTaskStatus(id: indexPath.row) {
            Persistance.shared.changeStatus(id: indexPath.row, status: false)
        } else {
            Persistance.shared.changeStatus(id: indexPath.row, status: true)
        }
        tableView.reloadData()
    }
    
//    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
//        return true
//    }
    
//    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
//        let deleteAction = UIContextualAction(style: .destructive, title: "Удалить") { (action, sourceView, completionHandler) in Persistance.shared.deleteTask(id: indexPath.row)
//            self.tableView.deleteRows(at: [indexPath], with: .automatic)
//            self.tableView.reloadData()
//            completionHandler(true)
//        }
//
//        let doneAction = UIContextualAction(style: .normal, title: "Выполнено") { (action, sourceView, completionHandler) in
//            let currentCell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TodoTableViewCell
//            Persistance.shared.saveTask(name: currentCell.taskName.text!, status: true)
//            self.tableView.reloadData()
//            completionHandler(true)
//        }
//
//        doneAction.backgroundColor = .systemGreen
//        deleteAction.backgroundColor = .systemRed
//
//        let preventSwipeFullAction = UISwipeActionsConfiguration(actions: [deleteAction, doneAction ])
//        preventSwipeFullAction .performsFirstActionWithFullSwipe = false
//        return preventSwipeFullAction
//    }
}

