//
//  Router.swift
//  ViperDemo
//
//  Created by Carlos Eduardo Santiago on 18/04/22.
//

import Foundation
import UIKit

//  Object
//  Entry Point!

// MARK - Typealias

typealias EntryPoint = AnyView & UserViewController

protocol AnyRouter {
    var entry: EntryPoint? { get }
    
    static func start() -> AnyRouter
}

class UserRouter: AnyRouter {
    
    // MARK - Public Properties

    var entry: EntryPoint?

    // MARK - Public Static Methos

    static func start() -> AnyRouter {
        let router = UserRouter()
        
        //Assing VIP
        var view: AnyView = UserViewController()
        var interactor: AnyInteractor = UserInteractor()
        var presenter: AnyPresenter = UserPresenter()
        
        view.presenter = presenter
        interactor.presenter = presenter
        
        presenter.router = router
        presenter.view = view
        presenter.interactor = interactor
        
        router.entry = view as? EntryPoint
        
        return router
    }
}
