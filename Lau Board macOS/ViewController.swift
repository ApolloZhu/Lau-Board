//
//  ViewController.swift
//  Lau Board macOS
//
//  Created by Apollo Zhu on 9/4/17.
//  Copyright © 2017 Ben Cullen. All rights reserved.
//

import Cocoa

class ViewController: NSViewController, NSCollectionViewDataSource, NSCollectionViewDelegate {

    @IBOutlet weak var collectionView: NSCollectionView!

    public func collectionView(_ collectionView: NSCollectionView, numberOfItemsInSection section: Int) -> Int {
        return LauQuote.all.count
    }

    public func collectionView(_ collectionView: NSCollectionView, itemForRepresentedObjectAt indexPath: IndexPath) -> NSCollectionViewItem {
        return (collectionView.makeItem(withIdentifier: .init("CollectionViewItem"), for: indexPath) as! CollectionViewItem).settingLauQuoteID(indexPath.item)
    }

    func collectionView(_ collectionView: NSCollectionView, didSelectItemsAt indexPaths: Set<IndexPath>) {
    }
}
