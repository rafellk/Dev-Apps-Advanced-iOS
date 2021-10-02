//
//  UIView+Extension.swift
//  JewelleryApp
//
//  Created by aluno on 02/10/21.
//

import UIKit

extension UIView {
    
    func constrainToSuperviewEdges(_ edges: UIEdgeInsets) {
        guard let superview = superview else {
            fatalError("Superview is not here")
        }
        
        leadingAnchor.constraint(equalTo: superview.leadingAnchor, constant: edges.left).isActive = true
        trailingAnchor.constraint(equalTo: superview.trailingAnchor, constant: -edges.right).isActive = true
        topAnchor.constraint(equalTo: superview.topAnchor, constant: edges.top).isActive = true
        bottomAnchor.constraint(equalTo: superview.bottomAnchor, constant: -edges.bottom).isActive = true
    }
    
    func constrainToSuperviewSafeAreaEdges(_ edges: UIEdgeInsets) {
        guard let superview = superview else {
            fatalError("Superview is not here")
        }
        
        leadingAnchor.constraint(equalTo: superview.leadingAnchor, constant: edges.left).isActive = true
        trailingAnchor.constraint(equalTo: superview.trailingAnchor, constant: -edges.right).isActive = true
        topAnchor.constraint(equalTo: superview.safeAreaLayoutGuide.topAnchor, constant: edges.top).isActive = true
        bottomAnchor.constraint(equalTo: superview.safeAreaLayoutGuide.bottomAnchor, constant: -edges.bottom).isActive = true
    }

    func constrainToSuperviewReadableContentEdges(_ edges: UIEdgeInsets) {
        guard let superview = superview else {
            fatalError("Superview is not here")
        }
        
        leadingAnchor.constraint(equalTo: superview.readableContentGuide.leadingAnchor, constant: edges.left).isActive = true
        trailingAnchor.constraint(equalTo: superview.readableContentGuide.trailingAnchor, constant: -edges.right).isActive = true
        topAnchor.constraint(equalTo: superview.safeAreaLayoutGuide.topAnchor, constant: edges.top).isActive = true
        bottomAnchor.constraint(equalTo: superview.safeAreaLayoutGuide.bottomAnchor, constant: -edges.bottom).isActive = true
    }
}

extension UIEdgeInsets {
    
    static func initializer(top: CGFloat = 0, left: CGFloat = 0, bottom: CGFloat = 0, right: CGFloat = 0) -> UIEdgeInsets {
        UIEdgeInsets(top: top, left: left, bottom: bottom, right: right)
    }
    
    static func initializer(all: CGFloat = 0) -> UIEdgeInsets {
        UIEdgeInsets(top: all, left: all, bottom: all, right: all)
    }
}
