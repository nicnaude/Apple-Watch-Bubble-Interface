//
//  CollectionViewCell.swift
//  Apple Watch Bubble Interface
//
//  Created by Nicholas Naudé on 27/04/2016.
//  Copyright © 2016 Nicholas Naudé. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.contentView.layer.cornerRadius = frame.width / 2.0
        self.contentView.layer.backgroundColor = UIColor(red: 0.0, green: 0.0, blue: 0.9, alpha: 0.8).CGColor
    }//
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
