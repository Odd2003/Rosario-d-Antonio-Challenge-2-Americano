//
//  Series.swift
//  TV Time Recreation
//
//  Created by Rosario d'Antonio on 07/11/25.
//

import Foundation

struct Series: Identifiable {
    
    var id: UUID = UUID()
    
    var name: String = ""
    var dayOfRelease: Int = 1
    
}

class SeriesList {
    
    var series: [Series] = [
        Series(name: "SPYxFAMILY", dayOfRelease: 1),
        Series(name: "InuYasha", dayOfRelease: 2),
        Series(name: "Helluva-Boss", dayOfRelease: 3),
        Series(name: "Gachiakuta", dayOfRelease: 4)
    ]
    
}
