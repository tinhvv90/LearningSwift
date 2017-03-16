//
//  CoreDataManaged.swift
//  Coredata_Add
//
//  Created by Đỗ Việt on 3/7/17.
//  Copyright © 2017 Do Viet. All rights reserved.
//

import UIKit
import CoreData

class CoreDataManaged: NSObject {
    
    private class func getContext() -> NSManagedObjectContext {
        
        let appDel = UIApplication.shared.delegate as! AppDelegate
        return appDel.persistentContainer.viewContext
        
    }
    
    class func saveObj() {
        
        let context = getContext()
        
        let entity = NSEntityDescription.entity(forEntityName: "Person", in: context)
        
        let managedObj = NSManagedObject(entity: entity!, insertInto: context)
        
        managedObj.setValue("Nguyen Van An", forKey: "fullname")
        
        do {
            try context.save()
            print("saved")
        } catch let error {
            fatalError("Error \(error)")
        }
        
    }
    
    
}
