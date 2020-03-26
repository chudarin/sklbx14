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

//class DBManager {
//    private var database: Realm
//    static let sharedInstance = DBManager()
//
//    private init() {
//       database = try! Realm()
//    }
//
//    func getDataFromDB() -> Results<TaskArray> {
//        let results: Results = database.objects(TaskArray.self)
//        return results
//    }
//
//    func addData(object: [ForecastWeatherClass]) {
//        try! database.write { database.add(object, update: Realm.UpdatePolicy(rawValue: 2)!)
//            print("Added new object")
//        }
//    }
//
//    func deleteAllFromDatabase() {
//        try! database.write {
//            database.deleteAll()
//        }
//    }
//
//    func deleteFromDb(object: TaskArray) {
//        try! database.write {
//            database.delete(object)
//        }
//    }
//}

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
}
