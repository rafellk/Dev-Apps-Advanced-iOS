//
//  UIView+Extension.swift
//  DeliveryApp
//
//  Created by Rafael Lucena on 9/7/20.
//  Copyright © 2020 Rafael Lucena. All rights reserved.
//

import UIKit

extension UIView {

    func autoPinToSuperViewEdges() {
        guard let superview = superview else { return }
        
        NSLayoutConstraint.activate([
            self.bottomAnchor.constraint(equalTo: superview.bottomAnchor),
            self.topAnchor.constraint(equalTo: superview.topAnchor),
            self.leadingAnchor.constraint(equalTo: superview.leadingAnchor),
            self.trailingAnchor.constraint(equalTo: superview.trailingAnchor),
        ])
    }
}
