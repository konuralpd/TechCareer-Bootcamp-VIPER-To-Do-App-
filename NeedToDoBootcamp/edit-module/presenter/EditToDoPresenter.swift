//
//  EditToDoPresenter.swift
//  NeedToDoBootcamp
//
//  Created by Mac on 26.08.2022.
//

import Foundation


class EditToDoPresenter: ViewToPresenterEditToDoProtocol {
    var editToDoInteractor: PresenterToInteractorEditToDoProtocol?
    
    func update(todo_id: Int, todo_text: String) {
        editToDoInteractor?.updateToDo(todo_id: todo_id, todo_text: todo_text)
    }
    
    
}
