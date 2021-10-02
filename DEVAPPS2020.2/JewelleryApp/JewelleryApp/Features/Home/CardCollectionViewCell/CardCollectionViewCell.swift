//
//  CardCollectionViewCell.swift
//  JewelleryApp
//
//  Created by aluno on 02/10/21.
//

import UIKit

struct CardCollectionViewCellModel {
    let imageName: String
    let title: String
    let subtitle: String
    let price: String
}

final class CardCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var containerView: UIView!
    
    override func awakeFromNib() {
        containerView.layer.cornerRadius = 32
        priceLabel.layer.cornerRadius = 9
    }
    
    func configure(model: CardCollectionViewCellModel) {
        imageView.image = UIImage(named: model.imageName)
        titleLabel.text = model.title
        subtitleLabel.text = model.subtitle
        priceLabel.text = "$ \(model.price)"
    }
}
