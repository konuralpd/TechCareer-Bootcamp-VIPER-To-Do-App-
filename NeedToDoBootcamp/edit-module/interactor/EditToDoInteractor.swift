//
//  EditToDoInteractor.swift
//  NeedToDoBootcamp
//
//  Created by Mac on 26.08.2022.
//

import Foundation

class EditToDoInteractor : PresenterToInteractorEditToDoProtocol {

    
    let db : FMDatabase?
    
    init() {
        let destinationPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let copyPath = URL(fileURLWithPath: destinationPath).appendingPathComponent("todo.db")
        db = FMDatabase(path: copyPath.path)
    }
    
    func updateToDo(todo_id: Int, todo_text: String) {
        db?.open()
        
        do {
            try db!.executeUpdate("UPDATE toDoList SET todo_text = ? WHERE todo_id = ?", values: [todo_text, todo_id])
            
            
        } catch {
            print(error.localizedDescription)
        }
        
        db?.close()
    }
    
  
    
   
}
