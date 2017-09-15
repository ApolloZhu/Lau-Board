//
//  ViewController.swift
//  Lau Board
//
//  Created by Ben Cullen on 6/8/17.
//  Copyright © 2017 Ben Cullen. All rights reserved.
//

import UIKit
import AVFoundation

class CollectionViewController: UICollectionViewController {
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return LauQuote.all.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        cell.lauQuote = LauQuote.all[indexPath.row]
        return cell
    }

    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        Lau.only.speakQuote(id: indexPath.row)
    }
}
