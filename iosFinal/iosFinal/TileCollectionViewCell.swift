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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func configure(with viewModel: TileCollectionViewCellViewModel){
        contentView.backgroundColor = viewModel.backgroundColor
    }
    
    
}