//
//  EditToDoProtocols.swift
//  NeedToDoBootcamp
//
//  Created by Mac on 26.08.2022.
//

import Foundation


protocol ViewToPresenterEditToDoProtocol {
    var editToDoInteractor:PresenterToInteractorEditToDoProtocol? {get set}
    
    func update(todo_id: Int, todo_text: String)
}

protocol PresenterToInteractorEditToDoProtocol {
    func updateToDo(todo_id: Int, todo_text: String)
}

protocol PresenterToRouterEditToDoProtocol {
    static func createModule(ref:EditToDoViewController)
}
