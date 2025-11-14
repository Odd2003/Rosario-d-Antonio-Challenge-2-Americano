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
    var seasons: Int = 1
    var episodes: [Int] = [24]
    var watchedEpisodes: Int = 13
    
}


class SeriesList: Codable {
    
    var series: [Series] = [
        Series(name: "SPYxFAMILY", dayOfRelease: 1, watchedEpisodes: 3),
        Series(name: "InuYasha", dayOfRelease: 2),
        Series(name: "Helluva-Boss", dayOfRelease: 3, watchedEpisodes: 4),
        Series(name: "Gachiakuta", dayOfRelease: 1),
        Series(name: "Fruits-Basket", dayOfRelease: 6),
        Series(name: "Cardcaptor-Sakura", dayOfRelease: 4, watchedEpisodes: 6),
        Series(name: "One-Piece", dayOfRelease: 7, seasons: 11, episodes: [90, 90, 90, 90, 90, 90, 90, 90, 90, 90, 90], watchedEpisodes: 865),
        Series(name: "BEASTARS", dayOfRelease: 5,  seasons: 2, episodes: [12, 12], watchedEpisodes: 14),
        Series(name: "Hunter-x-Hunter", dayOfRelease: 6, watchedEpisodes: 8),
        Series(name: "That-Time-I-Got-Reincarnated-as-a-Slime", dayOfRelease: 5, watchedEpisodes: 16),
    ]
    
}

var sharedData = SeriesList()
