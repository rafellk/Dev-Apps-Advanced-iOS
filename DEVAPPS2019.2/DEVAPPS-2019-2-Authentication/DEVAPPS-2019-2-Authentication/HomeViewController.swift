//
//  HomeViewController.swift
//  DEVAPPS-2019-2-Authentication
//
//  Created by Rafael Lucena on 7/28/20.
//  Copyright © 2020 Rafael Lucena. All rights reserved.
//

import UIKit

protocol HomeViewControllerDelegate {
    func didFinish()
}

class HomeViewController: UIViewController {

    var callback: (() -> Void)?
    var delegate: HomeViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        callback?()
        delegate?.didFinish()
        NotificationCenter.default.post(name: .didFinishNotification, object: nil)
    }

    @IBAction func signOutButtonPresed(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}
