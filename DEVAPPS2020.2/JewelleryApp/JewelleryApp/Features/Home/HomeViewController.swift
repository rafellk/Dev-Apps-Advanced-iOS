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
    @IBOutlet weak var headerStackView: UIStackView!
    @IBOutlet weak var collectionViewTopConstraint: NSLayoutConstraint?
    private var collectionViewLandscapeTopConstraint: NSLayoutConstraint?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureBackgroundGradient(isLandscape: false)
        configureNavigationBar()
        configureSearchTextField()
        configureCollectionView()
    }
    
    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        let isLandscape = newCollection.verticalSizeClass == .compact
        configureBackgroundGradient(isLandscape: isLandscape)
        
        headerStackView.isHidden = isLandscape
        configureRightBarButtons(isLandscape: isLandscape)
        
        navigationItem.title = isLandscape ? "Best jewellery for you" : nil
        
        if isLandscape {
            collectionViewTopConstraint?.isActive = false
            collectionViewLandscapeTopConstraint = collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
            collectionViewLandscapeTopConstraint?.isActive = true
        } else {
            collectionViewTopConstraint = collectionView.topAnchor.constraint(equalTo: headerStackView.bottomAnchor, constant: 18)
            collectionViewTopConstraint?.isActive = true
            
            collectionViewLandscapeTopConstraint?.isActive = false
            collectionViewLandscapeTopConstraint = nil
        }
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
        configureRightBarButtons(isLandscape: false)
    }
    
    func configureSearchTextField() {
        searchTextField.layer.cornerRadius = 18
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 35, height: self.searchTextField.frame.height))
        searchTextField.leftView = paddingView
        searchTextField.leftViewMode = .always
    }
    
    func configureBackgroundGradient(isLandscape: Bool) {
        let gradient = CAGradientLayer()
        if isLandscape {
            gradient.frame = CGRect(origin: UIScreen.main.bounds.origin,
                                    size: CGSize(width: UIScreen.main.bounds.height,
                                                 height: UIScreen.main.bounds.width))
        } else {
            gradient.frame = UIScreen.main.bounds
        }
        
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
    
    func configureRightBarButtons(isLandscape: Bool) {
        if isLandscape {
            navigationItem.rightBarButtonItems = [UIBarButtonItem(image: UIImage(systemName: "cart"),
                                                                  style: .plain,
                                                                  target: nil,
                                                                  action: nil),
                                                  UIBarButtonItem(image: UIImage(systemName: "magnifyingglass"),
                                                                  style: .plain,
                                                                  target: nil,
                                                                  action: nil)]
        } else {
            navigationItem.rightBarButtonItems = [UIBarButtonItem(image: UIImage(systemName: "cart"),
                                                                  style: .plain,
                                                                  target: nil,
                                                                  action: nil)]
        }
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
