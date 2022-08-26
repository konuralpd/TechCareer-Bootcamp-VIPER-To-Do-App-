//
//  NewPresenter.swift
//  NeedToDoBootcamp
//
//  Created by Mac on 26.08.2022.
//

import Foundation


class NewToDoPresenter: ViewToPresenterNewToDoProtocol {
   
    var newToDoInteractor: PresenterToInteractorNewToDoProtocol?
    
    func add(todo_text: String) {
        newToDoInteractor?.addToDo(todo_text: todo_text)
    }
    
}
