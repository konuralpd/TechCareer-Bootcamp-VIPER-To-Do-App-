//
//  NewInteractor.swift
//  NeedToDoBootcamp
//
//  Created by Mac on 26.08.2022.
//

import Foundation


class NewToDoInteractor: PresenterToInteractorNewToDoProtocol {
    let db: FMDatabase?
    
    init() {
        let destinationPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let copyPath = URL(fileURLWithPath: destinationPath).appendingPathComponent("todo.db")
        db = FMDatabase(path: copyPath.path)
    }
    
    func addToDo(todo_text: String) {
        db?.open()
        
        do {
            try db!.executeUpdate("INSERT INTO toDoList (todo_text) VALUES (?)", values: [todo_text])
            
            
        } catch {
            print(error.localizedDescription)
        }
        
        db?.close()
    }
}

