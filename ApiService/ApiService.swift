//
//  ApiService.swift
//  MAnDAr_App
//
//  Created by arizngy on 17/06/2021.

import UIKit
import CoreData

class ApiService: NSObject {
    
    static let sharedInstance = ApiService()
    
    func saveUser(user: User?) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "Users", in: context)
        let newUser = NSManagedObject(entity: entity!, insertInto: context)
        newUser.setValue(user?.full_name, forKey: "full_name")
        
        CurrentUser.full_name=user?.full_name ?? ""
        newUser.setValue(user?.email, forKey: "email")
        CurrentUser.email=user?.email ?? ""
        newUser.setValue(user?.phone_number, forKey: "phone_number")
        CurrentUser.phone_number=user?.phone_number ?? ""
        newUser.setValue(user?.password, forKey: "password")
        CurrentUser.password=user?.password ?? ""
        do {
            try context.save()
        } catch {
            print("Failed saving")
        }
    }
    
    func checkUser(name: String, password: String) -> Bool
    {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Users")
        let predicate = NSPredicate(format: "full_name == %@", name)
        
        request.predicate = predicate
        request.fetchLimit = 1
             
        do{
                let app = UIApplication.shared.delegate as! AppDelegate
                let context = app.persistentContainer.viewContext
                let count = try context.count(for: request)
                if(count == 0){
                    print("no present")
                    return false
                }
                
            }
            catch let error as NSError {
                print("Could not fetch \(error), \(error.userInfo)")
                return false
            }
        return true
    }
    
}
