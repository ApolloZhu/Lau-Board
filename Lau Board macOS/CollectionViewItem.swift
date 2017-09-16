//
//  CollectionViewItem.swift
//  Lau Board macOS
//
//  Created by Apollo Zhu on 9/4/17.
//  Copyright © 2017 Ben Cullen. All rights reserved.
//

import Cocoa

class CollectionViewItem: NSCollectionViewItem {
    public var lauQuoteID: Int? { didSet { update() } }
    
    func settingLauQuoteID(_ id: Int) -> CollectionViewItem {
        lauQuoteID = id
        return self
    }
    
    func update() {
        guard let button = view.viewWithTag(1) as? NSButton,
            let id = lauQuoteID else { return }
        button.target = self
        button.action = #selector(speak)
        button.title = LauQuote.all[id].name
    }
    
    @objc func speak() {
        guard let id = lauQuoteID else { return }
        Lau.only.speakQuote(id: id)
    }
}
