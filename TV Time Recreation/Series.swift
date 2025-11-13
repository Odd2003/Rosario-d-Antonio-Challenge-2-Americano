//
//  Series.swift
//  TV Time Recreation
//
//  Created by Rosario d'Antonio on 07/11/25.
//

import Foundation
import Combine

struct Series: Identifiable, Codable {
    
    var id: UUID = UUID()
    
    var name: String = ""
    var dayOfRelease: Int
    var episodes: Int = 24
    var watchedEpisodes: Int = 13
    
}


class SeriesList: Codable {
    
    var series: [Series] = [
        Series(name: "SPYxFAMILY", dayOfRelease: 1, watchedEpisodes: 2),
        Series(name: "InuYasha", dayOfRelease: 2),
        Series(name: "Helluva-Boss", dayOfRelease: 3),
        Series(name: "Gachiakuta", dayOfRelease: 1),
        Series(name: "Fruits-Basket", dayOfRelease: 6),
        Series(name: "Cardcaptor-Sakura", dayOfRelease: 4),
        Series(name: "One-Piece", dayOfRelease: 7),
        Series(name: "BEASTARS", dayOfRelease: 5),
        Series(name: "Hunter-x-Hunter", dayOfRelease: 6),
        Series(name: "That-Time-I-Got-Reincarnated-as-a-Slime", dayOfRelease: 5, watchedEpisodes: 16),
    ]
    
}

var sharedData = SeriesList()
