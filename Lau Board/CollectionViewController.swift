//
//  ViewController.swift
//  Lau Board
//
//  Created by Ben Cullen on 6/8/17.
//  Copyright © 2017 Ben Cullen. All rights reserved.
//

import UIKit
import AVFoundation

class CollectionViewController: UICollectionViewController, AVAudioPlayerDelegate {

    private var audioPlayer: AVAudioPlayer?
    private lazy var audioSession: AVAudioSession = .init()

    let soundReferences: [(displayName: String, fileName: String)] = [
        ("Alrigth", "allright"),
        ("Any Questions?", "anyquestions"),
        ("AYE", "aye"),
        ("Can Do Better", "candobetter"),
        ("It's Doable", "doable"),
        ("Cup of Java", "java"),
        ("Lunchtime", "lunch"),
        ("I'm Moses", "moses"),
        ("OHH", "ohh"),
        ("OH NO!", "ohno"),
        ("OK", "ok"),
        ("Put away Cell Phone", "putawayyourcellphone"),
        ("See Me", "seemepls"),
        ("VERY Doable", "verydoable")
    ]

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return soundReferences.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        cell.titleButton.tag = indexPath.row
        cell.titleButton.setTitle(soundReferences[indexPath.row].displayName, for: .normal)
        return cell
    }

    @IBAction func playSound(_ sender: UIButton) {
        let fileURL = Bundle.main.url(forResource: soundReferences[sender.tag].fileName, withExtension: "wav")!
        // Create audio player with sound file
        audioPlayer = try? AVAudioPlayer(contentsOf: fileURL)
        audioPlayer?.prepareToPlay()
        audioPlayer?.delegate = self
        // Play sound using audio player
        try? audioSession.setCategory(AVAudioSessionCategoryPlayback)
        try? audioSession.setActive(true, with: .notifyOthersOnDeactivation)
        audioPlayer?.play()
   }

    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        try? audioSession.setActive(false, with: .notifyOthersOnDeactivation)
    }
}
