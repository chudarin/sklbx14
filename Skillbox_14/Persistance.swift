//
//  Persistance.swift
//  Skillbox_14
//
//  Created by Sergey Chudarin on 20.03.2020.
//  Copyright © 2020 Sergey Chudarin. All rights reserved.
//

import Foundation
import RealmSwift

class Task: Object {
    @objc dynamic var taskName = ""
}

class TaskArray: Object {
    dynamic var taskArray: [ForecastWeatherClass] = []
}

class Persistance {
    
    // USER DEFAULTS
    static let shared = Persistance()
    
    private let kFirstNameKey = "Persistance.kFirstNameKey"
    var firstName: String? {
        // Записываем под ключом kFirstNameKey
        set { UserDefaults.standard.set(newValue, forKey: kFirstNameKey) }
        get { return UserDefaults.standard.string(forKey: kFirstNameKey) }
    }
    
    private let kLastNameKey = "Persistance.kLastNameKey"
    var lastName: String? {
        set { UserDefaults.standard.set(newValue, forKey: kLastNameKey) }
        get { return UserDefaults.standard.string(forKey: kLastNameKey) }
    }
    
    // REALM
    private let realm = try! Realm()
    
    func saveTask(name: String) {
        let task = Task()
        task.taskName = name
        try! realm.write {
            realm.add(task)
        }
    }
    
    func doPresets(taskName: String) {
        let task = Task()
        task.taskName = taskName
        try! realm.write {
            realm.add(task)
        }
    }
    
    func tasksCount() -> Int {
        return realm.objects(Task.self).count
    }
    
    func getTaskName(id: Int) -> String {
        return realm.objects(Task.self)[id].taskName
    }
    
    func deleteTask(id: Int) {
        try! realm.write {
            realm.delete(realm.objects(Task.self)[id])
        }
    }
    
    func saveWeatherArray(array: [ForecastWeatherClass]) {
        let anArray = TaskArray()
        anArray.taskArray = array
        try! realm.write {
            realm.add(anArray)
        }
    }
    
    func getWeatherArray() -> [ForecastWeatherClass] {
        return realm.objects(TaskArray.self)[0].taskArray
    }
}
