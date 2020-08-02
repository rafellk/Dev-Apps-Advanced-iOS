//
//  ViewController.swift
//  DEVAPPS-2019-2-Authentication
//
//  Created by Rafael Lucena on 7/27/20.
//  Copyright © 2020 Rafael Lucena. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func buttonTapped(_ sender: Any) {
        let viewController = HomeViewController(nibName: "HomeViewController", bundle: nil)
        navigationController?.pushViewController(viewController, animated: true)
    }

    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        if newCollection.verticalSizeClass == .compact {
            guard let viewController = UIStoryboard(name: "SignIn", bundle: nil).instantiateInitialViewController() else {
                return
            }

            present(viewController, animated: true)
        }
    }
}
