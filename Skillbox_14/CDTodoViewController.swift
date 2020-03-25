//
//  CDTodoViewController.swift
//  Skillbox_14
//
//  Created by Sergey Chudarin on 23.03.2020.
//  Copyright © 2020 Sergey Chudarin. All rights reserved.
//

import UIKit
import CoreData

class CDTodoViewController: UIViewController {
    
    var cdTaskList = [CDTask]()
    var moc:NSManagedObjectContext!
    let appDelegate = UIApplication.shared.delegate as? AppDelegate
    
    var cdTcVC: CDTodoTaskViewController?
    
    @IBOutlet weak var tableView2: UITableView!
    @IBOutlet weak var addTaskButton2: UIButton!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? CDTodoTaskViewController {
            cdTcVC = vc
            cdTcVC?.delegate = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView2.dataSource = self
        moc = appDelegate?.persistentContainer.viewContext
        loadData()
    }
    
    func saveTask(taskName: String) {
        let task = CDTask(context: moc)
        task.taskName = taskName
        appDelegate?.saveContext()
        loadData()
    }
    
    func loadData() {
        let taskRequest:NSFetchRequest<CDTask> = CDTask.fetchRequest()
        let sortDescriptor = NSSortDescriptor(key: "taskName", ascending: false)
        taskRequest.sortDescriptors = [sortDescriptor]
        do {
            try cdTaskList = moc.fetch(taskRequest)
        } catch {
            print("Could not load data")
        }
        self.tableView2.reloadData()
    }
    
    func deleteData() {
        let task = CDTask(context: moc)
        moc.delete(task)
    }
}

extension CDTodoViewController: CDTodoTaskViewControllerDelegate, UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cdTaskList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! CDTableViewCell
        
        let task = cdTaskList[indexPath.row]
        let taskName = task.taskName
        
        cell.taskName.text = taskName
        cell.taskNum.text = String(indexPath.row + 1)
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
      if editingStyle == .delete {
        let task = cdTaskList.remove(at: indexPath.row)
        tableView2.deleteRows(at: [indexPath], with: .automatic)
        moc.delete(task)
        moc.processPendingChanges()
      }
    }
    
    func reloadData() {
        tableView2.reloadData()
    }
    
    
}
