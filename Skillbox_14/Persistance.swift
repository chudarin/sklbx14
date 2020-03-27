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
    @objc dynamic var taskDone = false
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
    
    private let kHumidity = "Persistance.kHumidity"
    var humidity: String? {
        set { UserDefaults.standard.set(newValue, forKey: kHumidity) }
        get { return UserDefaults.standard.string(forKey: kHumidity) }
    }
    private let kTemp = "Persistance.kTemp"
    var temp: String? {
        set { UserDefaults.standard.set(newValue, forKey: kTemp) }
        get { return UserDefaults.standard.string(forKey: kTemp) }
    }
    private let kTempMax = "Persistance.kTempMax"
    var tempMax: String? {
        set { UserDefaults.standard.set(newValue, forKey: kTempMax) }
        get { return UserDefaults.standard.string(forKey: kTempMax) }
    }
    private let kTempMin = "Persistance.kTempMin"
    var tempMin: String? {
        set { UserDefaults.standard.set(newValue, forKey: kTempMin) }
        get { return UserDefaults.standard.string(forKey: kTempMin) }
    }
    
    
    // REALM
    private let realm = try! Realm()
    
    func saveTask(name: String, status: Bool) {
        let task = Task()
        task.taskName = name
        task.taskDone = status
        try! realm.write {
            realm.add(task)
        }
    }
    
    func changeStatus(id: Int, status: Bool) {
        try! realm.write {
            realm.objects(Task.self)[id].taskDone = status
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
    
    func getTaskStatus(id: Int) -> Bool {
        return realm.objects(Task.self)[id].taskDone
    }
    
    func deleteTask(id: Int) {
        try! realm.write {
            realm.delete(realm.objects(Task.self)[id])
        }
    }
}
