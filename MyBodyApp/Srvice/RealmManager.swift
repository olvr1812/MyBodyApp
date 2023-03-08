//
//  RealmManager.swift
//  MyBodyApp
//
//  Created by Оливер Салихов on 08.03.2023.
//

import RealmSwift

class RealmManager {
    static let shared = RealmManager()
    private init() {}
    
    let realm = try! Realm()
    
    func saveWorkoutModel(_ model: WorkoutModel) {
        try! realm.write {
            realm.add(model)
        }
    }
}
