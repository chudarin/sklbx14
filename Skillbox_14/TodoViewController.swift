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
        cell.taskNum.text = String(indexPath.row + 1)
        cell.taskName.text = Persistance.shared.getTaskName(id: indexPath.row)
        return cell
    }
    
    
    
}

