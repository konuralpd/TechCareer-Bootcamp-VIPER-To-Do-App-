//
//  HomeInteractor.swift
//  NeedToDoBootcamp
//
//  Created by Mac on 26.08.2022.
//

import Foundation


class HomeInteractor: PresenterToInteractorHomeProtocol {
    
    var homePresenter: InteractorToPresenterHomeProtocol?
    
    let db: FMDatabase?
    
    
    init() {
        let destinationPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let copyPath = URL(fileURLWithPath: destinationPath).appendingPathComponent("todo.db")
        db = FMDatabase(path: copyPath.path)
    }
    
    func getDataFromDB() {
        var toDoList = [toDo]()
        
        db?.open()
        
        do {
            let q = try db!.executeQuery("SELECT * FROM toDoList", values: nil)
            
            while q.next() {
                let todo = toDo(todo_id: Int(q.string(forColumn: "todo_id"))!, todo_text: q.string(forColumn: "todo_text")!)
                toDoList.append(todo)
            }
            
            homePresenter?.sendDataToPresenter(toDoList: toDoList)
            
        } catch {
            print(error.localizedDescription)
        }
        
        db?.close()
        
    }
    
    func searchToDo(with word: String) {
        var toDoList = [toDo]()
        
        db?.open()
        
        do {
            let q = try db!.executeQuery("SELECT * FROM toDoList WHERE todo_text like '%\(word)%'", values: [word])
            
            while q.next() {
                let todo = toDo(todo_id: Int(q.string(forColumn: "todo_id"))!, todo_text: q.string(forColumn: "todo_text")!)
                toDoList.append(todo)
            }
            
            homePresenter?.sendDataToPresenter(toDoList: toDoList)
            
        } catch {
            print(error.localizedDescription)
        }
        
        db?.close()
    }
    
    func deleteToDo(with todoID: Int, index: IndexPath) {
     
        db?.open()
        
        do {
            try db!.executeUpdate("DELETE FROM toDoList WHERE todo_id = ?", values: [todoID])
            getDataFromDB()
            
        } catch {
            print(error.localizedDescription)
        }
        
        db?.close()
    }
    
    
}



