//
//  ToDoListHere+CoreDataProperties.swift
//  
//
//  Created by Serguei Gonzalez on 3/25/21.
//
//

import Foundation
import CoreData


extension ToDoListHere {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ToDoListHere> {
        return NSFetchRequest<ToDoListHere>(entityName: "ToDoListHere")
    }

    @NSManaged public var taskText: String?
    @NSManaged public var createdAt: Date?

}

extension ToDoListHere: Identifiable{
    
}
