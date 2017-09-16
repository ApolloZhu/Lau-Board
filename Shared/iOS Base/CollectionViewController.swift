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
    
    #if os(tvOS)
    override func collectionView(_ collectionView: UICollectionView, didUpdateFocusIn context: UICollectionViewFocusUpdateContext, with coordinator: UIFocusAnimationCoordinator) {
        coordinator.addCoordinatedAnimations({
            context.previouslyFocusedView?.removeAllMotionEffect()
            context.nextFocusedView?.addtvOSMotionEffect()
        }, completion: nil)
    }
    #endif
}

extension UIView {
    func addtvOSMotionEffect() {
        let effects = [
            UIInterpolatingMotionEffect(keyPath: "center.x", type: .tiltAlongHorizontalAxis),
            UIInterpolatingMotionEffect(keyPath: "center.y", type: .tiltAlongVerticalAxis)
        ]
        for effect in effects {
            effect.minimumRelativeValue = -20
            effect.maximumRelativeValue = 20
            addMotionEffect(effect)
        }
        backgroundColor = .white
    }
    
    func removeAllMotionEffect() {
        for effect in motionEffects {
            removeMotionEffect(effect)
        }
        backgroundColor = .clear
    }
}
