//
//  OnboardingCollectionViewCell.swift
//  Challenge
//
//  Created by Rafael Lucena on 1/23/19.
//  Copyright © 2019 Rafael. All rights reserved.
//

import UIKit

struct OnboardingCollectionViewCellModel {
    var title: String?
    var description: String?
    var imageName: String?
    
    init(title: String, description: String, imageName: String) {
        self.title = title
        self.description = description
        self.imageName = imageName
    }
}

class OnboardingCollectionViewCell: UICollectionViewCell {
    // MARK: IBOutlets Variables
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var backgroundImage: UIImageView!
    
    // MARK: Model Variables
    var model: OnboardingCollectionViewCellModel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func populate(model: OnboardingCollectionViewCellModel) {
        self.model = model
        titleLabel.text = model.title
        descriptionLabel.text = model.description
        
        if let imageName = model.imageName {
            backgroundImage.image = UIImage(named: imageName)
        }
    }
}
