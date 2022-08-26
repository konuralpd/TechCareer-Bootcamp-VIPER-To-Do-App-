//
//  NewProtocols.swift
//  NeedToDoBootcamp
//
//  Created by Mac on 26.08.2022.
//

import Foundation


protocol ViewToPresenterNewToDoProtocol {
    var newToDoInteractor: PresenterToInteractorNewToDoProtocol? { get set }
    
    func add(todo_text: String)
}

protocol PresenterToInteractorNewToDoProtocol {
    func addToDo(todo_text: String)
}

protocol PresenterToRouterNewToDoProtocol {
    static func createModule(ref: NewToDoViewController )
}
