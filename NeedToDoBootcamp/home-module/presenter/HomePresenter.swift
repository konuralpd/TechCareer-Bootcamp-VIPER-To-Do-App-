//
//  HomePresenter.swift
//  NeedToDoBootcamp
//
//  Created by Mac on 26.08.2022.
//

import Foundation


class HomePresenter: ViewToPresenterHomeProtocol {
    
    var homeInteractor: PresenterToInteractorHomeProtocol?
    var homeView: PresenterToViewHomeProtocol?
    func getData() {
        homeInteractor?.getDataFromDB()
    }
    func search(word: String) {
        homeInteractor?.searchToDo(with: word)
    }
    
    func delete(todoID: Int, index: IndexPath) {
        homeInteractor?.deleteToDo(with: todoID, index: index)
    }
    
    
   
}

extension HomePresenter: InteractorToPresenterHomeProtocol {
    func sendDataToPresenter(toDoList: Array<toDo>) {
        homeView?.sendDataToView(toDoList: toDoList)
    }
}

