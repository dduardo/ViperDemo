//
//  Interactor.swift
//  ViperDemo
//
//  Created by Carlos Eduardo Santiago on 18/04/22.
//

import Foundation

//  Object
//  Protocol
//  Reference to Presenter

// https://jsonplaceholder.typicode.com/users

protocol AnyInteractor {
    var presenter: AnyPresenter? { get set }
    
    func getUsers()
}


class UserInteractor: AnyInteractor {

    // MARK - Public Properties

    var presenter: AnyPresenter?

    // MARK - Public Methods

    func getUsers() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else { return }
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data = data, error == nil else {
                self?.presenter?.interactDidFetchUsers(with: .failure(FetchError.failed))
                return
            }
        
            do {
                let entities = try JSONDecoder().decode([User].self, from: data)
                self?.presenter?.interactDidFetchUsers(with: .success(entities))
            } catch {
                self?.presenter?.interactDidFetchUsers(with: .failure(error))
            }
        }
        
        task.resume()
    }
}
