//
//  OnboardingViewController.swift
//  Challenge
//
//  Created by Rafael Lucena on 1/22/19.
//  Copyright © 2019 Rafael. All rights reserved.
//

import Foundation
import UIKit

class OnboardingViewController: UIViewController {
    
    // MARK: IBOutlets Variables
    @IBOutlet weak var collectionView: UICollectionView!
    
    // MARK: Datasource Variables
    var datasource = [
        OnboardingCollectionViewCellModel(title: "The best app ever", description: "First app with the new guys", imageName: "background"),
        OnboardingCollectionViewCellModel(title: "The best app ever", description: "First app with the new guys", imageName: "background")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(UINib(nibName: "OnboardingCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "OnboardingCollectionViewCell")
        collectionView.isPagingEnabled = true
        
        let gesture = UISwipeGestureRecognizer(target: self, action: #selector(gestureApplied))
        gesture.direction = .down
        view.addGestureRecognizer(gesture)
//        configureButton()
    }
    
    @objc func gestureApplied() {
        dismiss(animated: true, completion: nil)
    }
    
//    private func configureButton() {
//        closeButton.layer.cornerRadius = 3
//        closeButton.layer.masksToBounds = true
//    }
}

extension OnboardingViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OnboardingCollectionViewCell", for: indexPath) as! OnboardingCollectionViewCell
        let row = indexPath.row
        cell.populate(model: datasource[row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
