//
//  HomeViewController.swift
//  Login
//
//  Created by aluno on 17/09/21.
//  Copyright © 2021 Rafael Lucena. All rights reserved.
//

import UIKit

final class HomeViewController: UIViewController {

    @IBOutlet weak var welcomeLabel: UILabel!
    var username: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let username = username else { return }
        welcomeLabel.text = "Welcome \(username)"
    }
}
