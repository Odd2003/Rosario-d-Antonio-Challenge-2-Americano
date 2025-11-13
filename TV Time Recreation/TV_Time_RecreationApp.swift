//
//  TV_Time_RecreationApp.swift
//  TV Time Recreation
//
//  Created by Rosario d'Antonio on 07/11/25.
//

import SwiftUI

@main
struct TV_Time_RecreationApp: App {
    
    @State private var presented: Bool = false;
    @State private var showTitle: String = ""
    
    var seriesList: SeriesList = sharedData
    
    var body: some Scene {
        WindowGroup {
            NavigationStack() {
                TabBarView()
                
                
                    .navigationDestination(isPresented: $presented) {
                        ShowDetailView(show: findSeries(name: showTitle)).id(showTitle)
                    }
            }.onOpenURL { url in
                guard url.scheme == "myapp", url.host == "series" else { return }

                let rawTitle = url.lastPathComponent
                if let decodedTitle = rawTitle.removingPercentEncoding {
                    presented = true
                    showTitle = decodedTitle
                }
            }
        }
    }
    func findSeries(name: String) -> Series? {
        
        for series in seriesList.series {
            if(series.name == name) {
                return series
            }
        }
        return nil
    }
        
}
