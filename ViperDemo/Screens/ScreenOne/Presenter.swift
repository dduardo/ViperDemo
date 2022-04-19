//
//  Presenter.swift
//  ViperDemo
//
//  Created by Carlos Eduardo Santiago on 18/04/22.
//

import Foundation

// The glue
//  Object
//  Protocol
//  Reference to Interactor, Router and View

enum FetchError: Error  {
    case failed
}

protocol AnyPresenter {
    var router: AnyRouter? { get set }
    var interactor: AnyInteractor? { get set }
    var view: AnyView? { get set }
    
    func interactDidFetchUsers(with result: Result<[User], Error>)
    
}

class UserPresenter: AnyPresenter {
    
    // MARK - Public Properties

    var view: AnyView?
    var router: AnyRouter?
    var interactor: AnyInteractor? {
        didSet {
            interactor?.getUsers()
        }
    }

    // MARK - Public Methods
    
    func interactDidFetchUsers(with result: Result<[User], Error>) {
        switch result {
        case .success(let users):
            view?.update(with: users)
        case .failure:
            view?.update(with: "OPS... Something went wrong!")
        }
    }
}
