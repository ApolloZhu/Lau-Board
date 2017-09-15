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
        return Lau.only.quoteCount
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        cell.titleButton.tag = indexPath.row
        cell.titleButton.setTitle(soundReferences[indexPath.row].displayName, for: .normal)
        return cell
    }

    @IBAction func playSound(_ sender: UIButton) {
        Lau.only.speakQuote(index: sender.tag)
   }

}
