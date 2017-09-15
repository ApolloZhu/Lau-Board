//
//  CollectionViewCell.swift
//  Lau Board
//
//Users/Apollonian/Documents/Git-Repo/Lau-Board/Shared/Sound Effects/moses.wav/  Created by Apollo Zhu on 9/4/17.
//  Copyright © 2017 Ben Cullen. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    @IBOutlet private weak var titleLabel: UILabel! {
        titleLabel?.text = lauQuote?.name ?? ""
    }

    var lauQuote: LauQuote! {
        didSet {
            titleLabel?.text = lauQuote?.name ?? ""
        }
    }
}
