//
//  LauQuote.swift
//  Lau Board
//
//  Created by Apollo Zhu on 9/4/17.
//  Copyright © 2017 Ben Cullen. All rights reserved.
//

import Foundation

public struct LauQuote {
    public let id: Int
    public let name: String
    private let fileName: String

    public static let all: [LauQuote] = { [
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
        ].enumerated().map {
            LauQuote(id: $0.0, name: $0.1.0, fileName: $0.1.1)
        }
    }()
}

extension LauQuote {
    public var fileURL: URL! {
        return Bundle.main.url(forResource: fileName, withExtension: "wav")
    }
}
