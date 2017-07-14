//
//  CoreDataHelper.swift
//  toDoApp
//
//  Created by camille_mille on 2017/7/7.
//  Copyright © 2017年 camille_mille. All rights reserved.
//
import Foundation
import CoreData
import UIKit

class CoreDataHelper{
    static let appDelegate = UIApplication.shared.delegate as! AppDelegate
    static let persistentContainer = appDelegate.persistentContainer
    static let managedContext = persistentContainer.viewContext
    //static methods will go here
    
    static func newToDo() -> ToDo {
        let toDo = NSEntityDescription.insertNewObject(forEntityName: "ToDo", into: managedContext) as! ToDo
        return toDo
    }
    
    
    static func saveToDo() {
        do {
            try managedContext.save()
        } catch let error as NSError {
            print("Could not save \(error)")
        }
    }
    
    static func delete(toDo: ToDo) {
        managedContext.delete(toDo)
        saveToDo()
    }
    
    static func retrieveToDo() -> [ToDo] {
        let fetchRequest = NSFetchRequest<ToDo>(entityName: "ToDo")
        do {
            let results = try managedContext.fetch(fetchRequest)
            return results
        } catch let error as NSError {
            print("Could not fetch \(error)")
        }
        return []
    }
}
