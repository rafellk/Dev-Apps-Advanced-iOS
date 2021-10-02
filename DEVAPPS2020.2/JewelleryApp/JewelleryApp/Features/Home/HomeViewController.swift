//
//  HomeViewController.swift
//  JewelleryApp
//
//  Created by aluno on 02/10/21.
//

import UIKit

final class HomeViewController: UIViewController {

    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureBackgroundGradient()
        configureNavigationBar()
        configureSearchTextField()
        configureCollectionView()
    }
}

// MARK: Configuration methods extension
private extension HomeViewController {
    
    func configureNavigationBar() {
        navigationController?.setNavigationBarHidden(false, animated: true)
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "line.horizontal.3"),
                                                           style: .plain,
                                                           target: nil,
                                                           action: nil)
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "cart"),
                                                            style: .plain,
                                                            target: nil,
                                                            action: nil)
    }
    
    func configureSearchTextField() {
        searchTextField.layer.cornerRadius = 18
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 35, height: self.searchTextField.frame.height))
        searchTextField.leftView = paddingView
        searchTextField.leftViewMode = .always
    }
    
    func configureBackgroundGradient() {
        let gradient = CAGradientLayer()
        gradient.frame = UIScreen.main.bounds
        
        gradient.colors = [
            UIColor(named: "gradient_color")!.cgColor,
            UIColor(named: "onboarding_card_background")!.cgColor
        ]
        
        view.layer.insertSublayer(gradient, at: 0)
    }
    
    func configureCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "CardCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "cardCollectionViewCellID")
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 234, height: 300)
        layout.scrollDirection = .horizontal
        collectionView.collectionViewLayout = layout
        collectionView.showsHorizontalScrollIndicator = false
    }
}

extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cardCollectionViewCellID", for: indexPath) as? CardCollectionViewCell else {
            fatalError()
        }
        
        cell.configure(model: CardCollectionViewCellModel(imageName: "diamond_ring",
                                                          title: "Diamond Ring",
                                                          subtitle: "Pure ring with Diamonds (0.1400 Ct)",
                                                          price: "600"))
        return cell
    }
}
