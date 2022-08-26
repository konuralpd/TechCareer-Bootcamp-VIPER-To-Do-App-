//
//  HomeRouter.swift
//  NeedToDoBootcamp
//
//  Created by Mac on 26.08.2022.
//


import Foundation


class HomeRouter: PresenterToRouterHomeProtocol {
    static func createModule(ref: HomeViewController) {
        let presenter = HomePresenter()
        
        ref.homePresenterObject = presenter
        ref.homePresenterObject?.homeInteractor = HomeInteractor()
        ref.homePresenterObject?.homeView = ref
        
        ref.homePresenterObject?.homeInteractor?.homePresenter = presenter
        
    }
}
