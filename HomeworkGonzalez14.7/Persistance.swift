//
//  Persistance.swift
//  HomeworkGonzalez14.7
//
//  Created by Serguei Gonzalez on 3/24/21.
//

import Foundation


import RealmSwift


class ToDoList: Object {
    
   @objc dynamic var taskText: String = ""

    
}

class Weather: Object {
    @objc dynamic var temp: Float = 0.0
    @objc dynamic var speed: Float = 0.0
    @objc dynamic var humidity: Int = 0
    @objc dynamic var dt_txt: String = ""

}


class Persistance{
    static let shared = Persistance()
    
   let realm = try! Realm()
    


}

