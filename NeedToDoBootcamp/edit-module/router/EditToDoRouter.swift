//
//  EditToDoRouter.swift
//  NeedToDoBootcamp
//
//  Created by Mac on 26.08.2022.
//

import Foundation


class EditToDoRouter: PresenterToRouterEditToDoProtocol {
    static func createModule(ref: EditToDoViewController) {
        ref.editToDoPresenterObject = EditToDoPresenter()
        ref.editToDoPresenterObject?.editToDoInteractor = EditToDoInteractor()
    }
    
    
}
