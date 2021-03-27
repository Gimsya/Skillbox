//
//  ud2a.swift
//  HomeworkGonzalez14.7
//
//  Created by Serguei Gonzalez on 3/24/21.
//

import Foundation

class Ud2a {
    
    static let shared = Ud2a()
    
    private let kUserNameKey = "Ud2a.kUserNameKey"
    
    var userName : String? {
        set { UserDefaults.standard.set(newValue, forKey: kUserNameKey)}
        get { return UserDefaults.standard.string(forKey: kUserNameKey)}
    }
    
    private let kUserSurnameKey = "Ud2a.kUserSurnameKey"
    
    var userSurname : String? {
        set { UserDefaults.standard.set(newValue, forKey: kUserSurnameKey)}
        get { return UserDefaults.standard.string(forKey: kUserSurnameKey)}
    }
    
    
}
