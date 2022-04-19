//
//  View.swift
//  ViperDemo
//
//  Created by Carlos Eduardo Santiago on 18/04/22.
//

import UIKit

//  ViewController
//  Protocol
//  Reference Presenter

protocol AnyView {
    var presenter: AnyPresenter? { get set }
    
    func update(with users: [User])
    func update(with error: String)
}

class UserViewController: UIViewController, AnyView {
    
    // MARK - Public Properties

    var presenter: AnyPresenter?
    var users: [User] = []
    
    // MARK - Private Properties
    
    private let tableView: UITableView = {
        let tableView =  UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.isHidden = true
        return tableView
    }()
    
    private lazy var label: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.isHidden = true
        return label
    }()
    
    // MARK - Override and Initializers

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
        label.center = view.center
    }
    
    // MARK - Public Methods
    
    func update(with users: [User]) {
        DispatchQueue.main.async {
            self.users = users
            self.label.isHidden = true
            self.tableView.reloadData()
            self.tableView.isHidden = false
        }
    }
    
    func update(with error: String) {
        DispatchQueue.main.async {
            self.users = []
            self.label.text = error
            self.label.isHidden = false
            self.tableView.isHidden = true
        }
    }
    
    // MARK - Private Methods
    
    private func setupUI() {
        view.backgroundColor = .systemBlue

        setupLabel()
        setupTableView()
    }
    
    private func setupLabel() {
        view.addSubview(label)
        label.frame = CGRect(x: 0, y: 0, width: 200, height: 50)
    }
    
    private func setupTableView() {
        view.addSubview(tableView)
        tableView.dataSource = self
    }
}

// MARK - Extension UITableViewDataSource & UITableViewDelegate

extension UserViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = users[indexPath.row].name
        return cell
    }
}
