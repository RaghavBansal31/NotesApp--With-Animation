//
//  DataController.swift
//  Notes
//
//  Created by Consultant on 7/30/23.
//

import Foundation
import CoreData

class DataController: ObservableObject{
    
    let container = NSPersistentContainer(name: "Notes")

        
    
    init(){
        container.loadPersistentStores { desc, error in
            if let error = error{
                print("Failed To Load Data \(error.localizedDescription)")
            }
        }
    }
    
    
    func save(context: NSManagedObjectContext){
        do{
            try context.save()
            print("Data Saved")
        }catch{
            print("We didnt save the data")
        }
    }
    
    func addNote(name:String, textBody:String,context:NSManagedObjectContext){
        let entity = Entity(context: context)
        entity.id = UUID()
        entity.date = Date()
        entity.name = name
        entity.textBody = textBody
        
        save(context: context)
    }
    
    
    func editNote(entity: Entity, name:String, textBody:String,context:NSManagedObjectContext){
        entity.id = UUID()
        entity.date = Date()
        entity.name = name
        entity.textBody = textBody
        
        save(context: context)
    }
        
   
    
}
