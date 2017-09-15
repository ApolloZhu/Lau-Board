//
//  Lau.swift
//  Lau Board
//
//  Created by Apollo Zhu on 9/4/17.
//  Copyright © 2017 Ben Cullen. All rights reserved.
//

import AVFoundation

public class Lau: NSObject, AVAudioPlayerDelegate {
    public static let only = Lau()
    private override init() { }

    private var audioPlayer: AVAudioPlayer?
    #if !os(macOS)
    private lazy var audioSession: AVAudioSession = .init()
    #endif

    public func speakQuote(id: Int) {
        speakQuote(LauQuote.all[id])
    }

    public func speakQuote(_ quote: LauQuote) {
        // Create audio player with sound file
        audioPlayer = try? AVAudioPlayer(contentsOf: quote.fileURL)
        audioPlayer?.prepareToPlay()
        audioPlayer?.delegate = self
        // Play sound using audio player
        #if !os(macOS)
            try? audioSession.setCategory(AVAudioSessionCategoryPlayback)
            try? audioSession.setActive(true, with: .notifyOthersOnDeactivation)
        #endif
        audioPlayer?.play()
    }

    public func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        #if !os(macOS)
            try? audioSession.setActive(false, with: .notifyOthersOnDeactivation)
        #endif
    }
}
