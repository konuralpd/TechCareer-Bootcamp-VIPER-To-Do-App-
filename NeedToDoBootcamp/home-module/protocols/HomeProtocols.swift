//
//  HomeProtocols.swift
//  NeedToDoBootcamp
//
//  Created by Mac on 26.08.2022.
//


import Foundation


protocol ViewToPresenterHomeProtocol {
    
    var homeInteractor: PresenterToInteractorHomeProtocol? { get set }
    var homeView:PresenterToViewHomeProtocol? {get set}

    
    func getData()
    func search(word: String)
    func delete(todoID: Int, index: IndexPath)
    
   
}

protocol PresenterToInteractorHomeProtocol {
    
    var homePresenter: InteractorToPresenterHomeProtocol? { get set }
    
    func getDataFromDB()
    func searchToDo(with word: String)
    func deleteToDo(with todoID: Int, index: IndexPath)
    
}

protocol InteractorToPresenterHomeProtocol {
    func sendDataToPresenter(toDoList:Array<toDo>)
}


protocol PresenterToViewHomeProtocol {
    func sendDataToView(toDoList:Array<toDo>)
}

protocol PresenterToRouterHomeProtocol {
    static func createModule(ref: HomeViewController)
}
