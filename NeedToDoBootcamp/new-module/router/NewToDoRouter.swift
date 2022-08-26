//
//  NewRouter.swift
//  NeedToDoBootcamp
//
//  Created by Mac on 26.08.2022.
//

import Foundation


class NewToDoRouter: PresenterToRouterNewToDoProtocol {
    static func createModule(ref: NewToDoViewController) {
        ref.newToDoPresenterObject = NewToDoPresenter()
        ref.newToDoPresenterObject?.newToDoInteractor = NewToDoInteractor()
    }
}
