//
//  CollectionView.swift
//  Lau Board
//
//  Created by Apollo Zhu on 9/15/17.
//  Copyright © 2017 Ben Cullen. All rights reserved.
//

import UIKit

class CollectionView: UICollectionView {
    override func selectItem(at indexPath: IndexPath?, animated: Bool, scrollPosition: UICollectionViewScrollPosition) {
        super.selectItem(at: indexPath, animated: animated, scrollPosition: scrollPosition)
        delegate?.collectionView(self, didSelectItemAt: indexPath)
    }

    override func deselectItem(at indexPath: IndexPath, animated: Bool) {
        super.deselectItem(at: indexPath, animated: animated)
        delegate?.collectionView(self, didDeselectItemAt: indexPath)
    }
}
