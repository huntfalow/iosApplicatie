//
//  TileCollectionViewCell.swift
//  iosFinal
//
//  Created by Vincent on 16/06/2021.
//  Copyright © 2021 Vincent. All rights reserved.
//

import UIKit

class TileCollectionViewCell: UICollectionViewCell {
    static let identifier = "TileCollectionViewCell"
    
    @IBOutlet weak var imgCocktail: UIImageView!

    func configure(with viewModel: TileCollectionViewCellViewModel){
        contentView.backgroundColor = viewModel.backgroundColor
    }
    
    func configureData(image : String){
        imgCocktail.load(urlString: image)
    }
}
