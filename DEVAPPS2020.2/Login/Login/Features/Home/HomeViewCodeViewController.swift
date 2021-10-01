//
//  HomeViewCodeViewController.swift
//  Login
//
//  Created by aluno on 18/09/21.
//  Copyright © 2021 Rafael Lucena. All rights reserved.
//

import UIKit

final class HomeViewCodeViewController: UIViewController {

    private let username: String
    private let lastSignedInDate = Date()
    
    init(with username: String) {
        self.username = username
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureLayout()
    }
}

private extension HomeViewCodeViewController {
    
    func configureLayout() {
        let usernameLabel = UILabel()
        usernameLabel.textAlignment = .center
        usernameLabel.text = "Welcome \(username)"
        usernameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(usernameLabel)
        usernameLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        usernameLabel.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor).isActive = true
        
        let lastSignedInLabel = UILabel()
        lastSignedInLabel.textAlignment = .center
        lastSignedInLabel.text = "(Last sign in \(formatDate()))"
        lastSignedInLabel.font = UIFont.systemFont(ofSize: 14)
        lastSignedInLabel.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(lastSignedInLabel)
        lastSignedInLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        lastSignedInLabel.topAnchor.constraint(equalTo: usernameLabel.bottomAnchor, constant: 4).isActive = true
    }
    
    func formatDate() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM dd, YYYY"
        return formatter.string(from: lastSignedInDate)
    }
}
