//
//  Lau.swift
//  Lau Board
//
//  Created by Apollo Zhu on 9/4/17.
//  Copyright © 2017 Ben Cullen. All rights reserved.
//

import AVFoundation

fileprivate protocol Player {
    func start()
}

#if os(watchOS)
    import WatchKit
    extension WKAudioFilePlayer: Player {
        func start() {
            if status == .readyToPlay {
                play()
            }
        }
    }
#endif

@available(watchOSApplicationExtension 3.0, *)
extension AVAudioPlayer: Player { func start() { play() } }

public class Lau: NSObject, AVAudioPlayerDelegate {
    public static let only = Lau()
    private override init() { }
    
    private var player: Player?
    
    #if !os(macOS)
    private lazy var audioSession: AVAudioSession = .init()
    #endif
    
    public func speakQuote(id: Int) {
        speakQuote(LauQuote.all[id])
    }
    
    public func speakQuote(_ quote: LauQuote) {
        // Create audio player with sound file
        let url = quote.fileURL!
        if #available(watchOSApplicationExtension 3.0, *) {
            player = {
                let audioPlayer = try? AVAudioPlayer(contentsOf: url)
                audioPlayer?.prepareToPlay()
                audioPlayer?.delegate = self
                return audioPlayer
            }()
            // Play sound using audio player
            #if !os(macOS)
                try? audioSession.setCategory(AVAudioSessionCategoryPlayback)
                try? audioSession.setActive(true, with: .notifyOthersOnDeactivation)
            #endif
        } else {
            #if os(watchOS)
                player = WKAudioFilePlayer(playerItem: .init(asset: .init(url: url)))
            #endif
        }
        player?.start()
    }
    
    @available(watchOSApplicationExtension 3.0, *)
    public func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        #if !os(macOS)
            try? audioSession.setActive(false, with: .notifyOthersOnDeactivation)
        #endif
    }
}
