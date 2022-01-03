//
//  StudentManagerCoreData.swift
//  StudentList_18.11
//
//  Created by Арина  on 14.12.21.
//

import CoreData

class StudentManagerCoreData {
    
    func saveData(maleList: [String]?, femaleList: [String]?) {
        saveMaleList(maleList)
        saveFemaleList(femaleList)
        clearData()
    }
    
    private func saveMaleList(_ maleList: [String]?) {
        guard let maleList = maleList else {
            return
        }
        for name in maleList {
        saveStudent(name: name, gender: 0)
        }
    }
    private func saveFemaleList(_ femaleList: [String]?) {
        guard let femaleList = femaleList else {
            return
        }
        for name in femaleList {
        saveStudent(name: name, gender: 1)
        }
    }
    private func saveStudent(name: String, gender: Int) {
        let student = Student(context: context)
        student.name = name
        student.gender = Int16(gender)
        
        do {
            try context.save()
        } catch {
            print("Unable to Student \(error)")
        }
    }
    
    func readFemaleList() -> [String] {
       readStudent(gender: 1)
    }
    private func readStudent(gender: Int) -> [String] {
        let fetchRequest = NSFetchRequest<Student>(entityName: "Student")
        fetchRequest.predicate = NSPredicate(format: "gender == %i", gender)
        var array: [String] = []
        
        if let result = try? context.fetch(fetchRequest) {
        for object in result {
        if let name = object.name {
            array.append(name)
        }
        }
        }
        return array
    }
    
    func readMaleList() -> [String] {
        readStudent(gender: 0)
    }
    
    private func clearData() {
        let fetchRequest = NSFetchRequest<Student>(entityName: "Student")
        
        if let result = try? context.fetch(fetchRequest) {
            for object in result {
                context.delete(object)
            }
        }
    }
    
    private lazy var context: NSManagedObjectContext = {
        return persistentContainer.viewContext
    }()
    
private lazy var persistentContainer: NSPersistentContainer = {
    let container = NSPersistentContainer(name: "StudentCoreDataModel")
    
    container.loadPersistentStores(completionHandler: {(storeDescription, error) in
        if let error = error as NSError? {
            fatalError("Unresolved error \(error), \(error.userInfo)")
        }
    })
    return container
}()
    
    private func saveContext() {
        let context = context
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }


}
