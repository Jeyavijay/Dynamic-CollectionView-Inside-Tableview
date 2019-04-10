//
//  CollectionViewCellDashboard.swift
//  Kompete
//
//  Created by Jeyavijay Nedumaran on 4/9/19.
//  Copyright © 2019 Jeyavijay Nedumaran. All rights reserved.
//

import UIKit

class CollectionViewCellDashboard: UICollectionViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}

class DynamicCollectionView: UICollectionView {
    override func layoutSubviews() {
        super.layoutSubviews()
        if !__CGSizeEqualToSize(bounds.size, self.intrinsicContentSize) {
            self.invalidateIntrinsicContentSize()
        }
    }
    
    override var intrinsicContentSize: CGSize {
        return collectionViewLayout.collectionViewContentSize
    }
}
